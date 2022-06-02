import 'dart:developer';

import 'package:ccvc_mobile/config/app_config.dart';
import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/data/services/message_service.dart';
import 'package:ccvc_mobile/domain/locals/prefs_service.dart';
import 'package:ccvc_mobile/domain/model/message_model/message_sms_model.dart';

import 'package:ccvc_mobile/presentation/tabbar_screen/bloc/main_state.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

class MessageCubit extends BaseCubit<MainState> {
  MessageCubit() : super(MainStateInitial());
final String idUser = PrefsService.getUserId();
  void sendSms(String idRoom, String content) {

    MessageService.sendSms(
      idRoom,
      MessageSmsModel(
        id: idRoom,
        senderId: idUser,
        content: content,
        loaiTinNhan: 0,
      ),
    );
  }
  Stream<List<MessageSmsModel>>? chatStream(String idRoom){
    return MessageService.smsRealTime(idRoom);
  }
  Future<void> getRoomChat(String idUserChat) async {
    log('${idUserChat}');
   MessageService.findRoomChat(idUserChat);
  }
}
