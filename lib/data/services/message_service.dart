import 'dart:async';
import 'dart:developer';

import 'package:ccvc_mobile/config/app_config.dart';
import 'package:ccvc_mobile/config/default_env.dart';
import 'package:ccvc_mobile/config/firebase_config.dart';
import 'package:ccvc_mobile/domain/model/login/user_info.dart';
import 'package:ccvc_mobile/domain/model/message_model/message_sms_model.dart';
import 'package:ccvc_mobile/domain/model/message_model/room_chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageService {
  static Future<List<RoomChatModel>> getRoomChat() async {
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
            .doc(DefaultEnv.roomChartCollection)
            .collection(value)
            .doc(DefaultEnv.thongTinRoomChatCollect)
            .get();
        final jsonProfileRoom = profileRoom.data();
        if (jsonProfileRoom != null) {
          final listPeople = await getChatRoomUser(
              jsonProfileRoom['people_chat'] as List<dynamic>);
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

  static Future<UserInfoModel> getUserChat(String id) async {
    late UserInfoModel userProfile;
    final result = await FirebaseSetup.fireStore
        .collection(DefaultEnv.usersCollection)
        .doc(id)
        .collection(DefaultEnv.profileCollection)
        .get();
    for (final element in result.docs) {
      userProfile = UserInfoModel.fromJson(element.data());
    }
    return userProfile;
  }

  static Future<List<PeopleChat>> getChatRoomUser(List<dynamic> data) async {
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

  static Stream<List<MessageSmsModel>> smsRealTime(String idRoom) {
    return FirebaseSetup.fireStore
        .collection(DefaultEnv.messCollection)
        .doc(DefaultEnv.roomChartCollection)
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
  }

  static void sendSms(String idRoom, MessageSmsModel messageSmsModel) {
    final doc = FirebaseSetup.fireStore
        .collection(DefaultEnv.messCollection)
        .doc(DefaultEnv.roomChartCollection)
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
}
