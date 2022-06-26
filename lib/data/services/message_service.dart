import 'dart:async';
import 'dart:developer';

import 'package:ccvc_mobile/config/app_config.dart';
import 'package:ccvc_mobile/config/default_env.dart';
import 'package:ccvc_mobile/config/firebase_config.dart';
import 'package:ccvc_mobile/domain/model/message_model/message_sms_model.dart';
import 'package:ccvc_mobile/domain/model/message_model/room_chat_model.dart';
import 'package:ccvc_mobile/domain/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

class MessageService {
  static Future<List<RoomChatModel>> getRoomChat(String idUser) async {
    final listRoom = await FirebaseSetup.fireStore
        .collection(DefaultEnv.usersCollection)
        .doc(idUser)
        .collection(DefaultEnv.messCollection)
        .doc(DefaultEnv.messCollection)
        .get();
    final data = <RoomChatModel>[];

    final jsonRoomChat = listRoom.data();
    if (jsonRoomChat != null) {
      final idRooms = jsonRoomChat['idRoomChat'] as List<dynamic>;

      for (var value in idRooms) {
        final profileRoom = await FirebaseSetup.fireStore
            .collection(DefaultEnv.messCollection)
            .doc(value)
            .get();
        final jsonProfileRoom = profileRoom.data();
        if (jsonProfileRoom != null) {
          final listPeople = await _getChatRoomUser(
              jsonProfileRoom['people_chat'] as List<dynamic>, idUser);

          data.add(RoomChatModel(
              roomId: value,
              peopleChats: listPeople,
              colorChart: jsonProfileRoom['color_chart']));
        }
      }

      return data;
    }
    return [];
  }

  static Future<UserModel> getUserChat(String id) async {
    late UserModel userProfile;
    final result = await FirebaseSetup.fireStore
        .collection(DefaultEnv.usersCollection)
        .doc(id)
        .collection(DefaultEnv.profileCollection)
        .get();
    for (final element in result.docs) {
      log('${element.data()}');
      userProfile = UserModel.fromJson(element.data());
    }
    return userProfile;
  }

  static Future<List<PeopleChat>> _getChatRoomUser(
      List<dynamic> data, String idUser) async {
    final pepole = <PeopleChat>[];
    for (final element in data) {
      final id = element['user_id'];
      if (id != idUser) {
        final userInfo = await getUserChat(id.toString());
        pepole.add(
          PeopleChat(
            userId: id,
            avatarUrl: userInfo.avatarUrl ?? '',
            nameDisplay: userInfo.nameDisplay ?? '',
            bietDanh: element['biet_danh'],
          ),
        );
      }
    }
    return pepole;
  }

  static Stream<List<MessageSmsModel>>? smsRealTime(String idRoom) {
    try {
      return FirebaseSetup.fireStore
          .collection(DefaultEnv.messCollection)
          .doc(idRoom)
          .collection(idRoom)
          .doc(DefaultEnv.chatsCollection)
          .snapshots()
          .transform(
        StreamTransformer.fromHandlers(
          handleData: (docSnap, sink) {
            if (docSnap.exists) {
              final json = docSnap.data();
              if (json != null) {
                final data = <MessageSmsModel>[];
                final result = json['data'] as List<dynamic>;
                for (final element in result) {
                  data.add(MessageSmsModel.fromJson(element));
                }
                sink.add(data);
              }
            }
            // sink.add();
          },
        ),
      );
    } catch (e) {}
  }

  static void sendSms(String idRoom, MessageSmsModel messageSmsModel) {
    final doc = FirebaseSetup.fireStore
        .collection(DefaultEnv.messCollection)
        .doc(idRoom)
        .collection(idRoom)
        .doc(DefaultEnv.chatsCollection);
    doc.update({
      'data': FieldValue.arrayUnion([messageSmsModel.toJson()])
    }).onError((error, stackTrace) {
      if (error.toString().contains('cloud_firestore/not-found')) {
        doc.set({
          'data': FieldValue.arrayUnion([messageSmsModel.toJson()])
        });
      }
    });
  }

  static Future<List<RoomChatModel>> findRoomChat(String idUser) async {
    final result = <RoomChatModel>[];
    final listRoom = await FirebaseSetup.fireStore
        .collection(DefaultEnv.messCollection)
        .get();
    await Future.forEach(listRoom.docs,
        (QueryDocumentSnapshot<Map<String, dynamic>> item) async {
      final data = await FirebaseSetup.fireStore
          .collection(DefaultEnv.messCollection)
          .doc(item.id)
          .get();
      final room = RoomChatModel.fromJson(data.data() ?? {});
      result.add(room);
    });

    return result;
  }

  static Future<String> createRoomChat(RoomChatModel roomChatModel) async {
    await FirebaseSetup.fireStore
        .collection(DefaultEnv.messCollection)
        .doc(roomChatModel.roomId)
        .set(roomChatModel.toJson());
    roomChatModel.peopleChats.forEach((element) {
      _addUserRoomChat(element.userId, roomChatModel.roomId);
    });
    return roomChatModel.roomId;
  }

  static void _addUserRoomChat(String id, String idRoom) {
    final doc = FirebaseSetup.fireStore
        .collection(DefaultEnv.usersCollection)
        .doc(id)
        .collection(DefaultEnv.messCollection)
        .doc(DefaultEnv.messCollection);

    doc.update({
      'idRoomChat': FieldValue.arrayUnion([idRoom])
    }).onError((error, stackTrace) {
      if (error.toString().contains('cloud_firestore/not-found')) {
        doc.set({
          'idRoomChat': FieldValue.arrayUnion([idRoom])
        });
      }
    });
  }
}
