import 'dart:developer';
import 'dart:io';

import 'package:ccvc_mobile/config/app_config.dart';
import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/config/default_env.dart';
import 'package:ccvc_mobile/data/services/message_service.dart';
import 'package:ccvc_mobile/domain/locals/prefs_service.dart';
import 'package:ccvc_mobile/domain/model/message_model/message_sms_model.dart';

import 'package:ccvc_mobile/presentation/tabbar_screen/bloc/main_state.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

import '../../../data/helper/firebase/firebase_const.dart';

class MessageCubit extends BaseCubit<MainState> {
  MessageCubit() : super(MainStateInitial());
  final String idUser = PrefsService.getUserId();
  void sendSms(String idRoom, String content,{SmsType smsType = SmsType.Sms}) {
    MessageService.sendSms(
      idRoom,
      MessageSmsModel(
        id: idRoom,
        senderId: idUser,
        content: content,
        loaiTinNhan: smsType.getInt(),
      ),
    );
  }

  Future<void> sendImage(String idRoom, File file) async {
    final Reference ref = storage
        .ref()
        .child(DefaultEnv.messCollection)
        .child(idRoom)
        .child(file.path.convertNameFile());
    await ref.putFile(file);
    final url = await ref.getDownloadURL();
    sendSms(idRoom, url,smsType: SmsType.Image);
  }

  Stream<List<MessageSmsModel>>? chatStream(String idRoom) {
    return MessageService.smsRealTime(idRoom);
  }

  Future<void> getRoomChat(String idUserChat) async {
    log('${idUserChat}');
    MessageService.findRoomChat(idUserChat);
  }
}
