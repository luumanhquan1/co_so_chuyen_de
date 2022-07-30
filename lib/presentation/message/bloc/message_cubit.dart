import 'dart:developer';
import 'dart:io';

import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/config/default_env.dart';
import 'package:ccvc_mobile/data/services/message_service.dart';
import 'package:ccvc_mobile/data/services/profile_service.dart';
import 'package:ccvc_mobile/domain/locals/hive_local.dart';
import 'package:ccvc_mobile/domain/locals/prefs_service.dart';
import 'package:ccvc_mobile/domain/model/message_model/message_sms_model.dart';
import 'package:ccvc_mobile/domain/model/message_model/room_chat_model.dart';
import 'package:ccvc_mobile/domain/model/user_model.dart';

import 'package:ccvc_mobile/presentation/tabbar_screen/bloc/main_state.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:ccvc_mobile/widgets/views/show_loading_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

import '../../../data/helper/firebase/firebase_const.dart';

class MessageCubit extends BaseCubit<MainState> {
  MessageCubit() : super(MainStateInitial()) {
    showContent();
  }
  final String idUser = PrefsService.getUserId();
  String idRoomChat = '';
  final BehaviorSubject<String> _roomChat = BehaviorSubject<String>();
  final BehaviorSubject<List<UserModel>> selectCreateGroup = BehaviorSubject();
  List<UserModel> listFriend = [];

  late List<PeopleChat> peopleChat;
  List<PeopleChat>? peopleGroupChat;
  Stream<String> get roomChat => _roomChat.stream;
  void initDate(String id, List<PeopleChat> peopleChat) {
    showLoading();
    idRoomChat = id;
    this.peopleChat = peopleChat;
    getListFriend().then((value) {
      showContent();

      _roomChat.sink.add(id);
    });
  }

  Future<void> sendSms(String content, {SmsType smsType = SmsType.Sms}) async {
    if (idRoomChat.isEmpty) {
      idRoomChat = await createRoomChatDefault([
        PeopleChat(
          userId: peopleChat.first.userId,
          avatarUrl: peopleChat.first.avatarUrl,
          nameDisplay: peopleChat.first.nameDisplay,
          bietDanh: '',
        )
      ]);
      MessageService.sendSms(
        idRoomChat,
        MessageSmsModel(
          daXem: [idUser],
          messageId: const Uuid().v1(),
          id: idRoomChat,
          senderId: idUser,
          content: content,
          loaiTinNhan: smsType.getInt(),
        ),
      );
    } else {
      MessageService.sendSms(
        idRoomChat,
        MessageSmsModel(
          daXem: [idUser],
          messageId: const Uuid().v1(),
          id: idRoomChat,
          senderId: idUser,
          content: content,
          loaiTinNhan: smsType.getInt(),
        ),
      );
      MessageService.updateRoomChatUser(idUser, idRoomChat);
      for (var element in peopleChat) {
        MessageService.updateRoomChatUser(element.userId, idRoomChat);
      }
    }
  }

  Future<void> sendImage(File file) async {
    final Reference ref = storage
        .ref()
        .child(DefaultEnv.messCollection)
        .child(idRoomChat)
        .child(file.path.convertNameFile());
    await ref.putFile(file);
    final url = await ref.getDownloadURL();
    await sendSms(url, smsType: SmsType.Image);
  }

  Stream<List<MessageSmsModel>>? chatStream(String idRoom) {
    return MessageService.smsRealTime(idRoom);
  }

  Future<void> getRoomChat(String idUserChat) async {
    showLoading();
    final data = await MessageService.findRoomChat(idUserChat);
    await getListFriend();
    showContent();
    for (var element in data) {
      final peopleChatId = element.peopleChats.map((e) => e.userId);
      if (peopleChatId.contains(idUserChat) &&
          peopleChatId.contains(idUser) &&
          peopleChatId.length == 2) {
        idRoomChat = element.roomId;
        _roomChat.sink.add(idRoomChat);
        return;
      }
    }
  }

  Future<void> getListFriend() async {
    listFriend = await ProfileService.listFriends(idUser,getBloc: false);
  }

  Future<String> createRoomChatDefault(List<PeopleChat> peopleChat) async {
    ShowLoadingScreen.show();
    final idRoomChat = Uuid().v1();
    final userCurrent = HiveLocal.getDataUser();
    final room = RoomChatModel(
      roomId: idRoomChat,
      peopleChats: [
        PeopleChat(
          userId: idUser,
          avatarUrl: userCurrent?.avatarUrl ?? '',
          nameDisplay: userCurrent?.nameDisplay ?? '',
          bietDanh: '',
        ),
        ...peopleChat
      ],
      colorChart: 0,
      isGroup: peopleChat.length > 1,
    );
    _roomChat.sink.add(room.roomId);
    ShowLoadingScreen.dismiss();
    return MessageService.createRoomChat(room);
  }

  Future<void> addPeopleRoomChat(List<PeopleChat> peopleCha) async {
    ShowLoadingScreen.show();
    peopleChat.addAll(peopleCha);
    await MessageService.addPeopleRoomChat(peopleCha, idRoomChat);
    ShowLoadingScreen.dismiss();
  }

  void removePeople(String idUser) {
    peopleChat.removeWhere((element) => element.userId == idUser);
    log('$peopleChat');
    MessageService.removeChat(idRoomChat, idUser);
  }

  bool isBlock() {
    if (peopleChat.length == 1) {
      final data = listFriend.where((element) =>
          element.userId?.trim() == peopleChat.first.userId.trim());
      log('${data}');
      if (data.isNotEmpty) {
        return data.first.peopleType == PeopleType.Block;
      }
      return false;
    }
    return false;
  }
}
