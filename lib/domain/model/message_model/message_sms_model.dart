import 'package:ccvc_mobile/config/app_config.dart';
import 'package:uuid/uuid.dart';

enum SmsType { Sms, Image }

class MessageSmsModel {
  String? id;
  String? senderId;
  String? content;
  int? loaiTinNhan;

  SmsType smsType = SmsType.Sms;
  MessageSmsModel({this.id, this.senderId, this.content, this.loaiTinNhan}) {
    smsType = fromEnum(loaiTinNhan ?? 0);
  }
  bool isMe(){
    if(senderId == idUser){
      return true;
    }
    return false;
  }
  SmsType fromEnum(int loaiTinNhan) {
    switch (loaiTinNhan) {
      case 0:
        return SmsType.Sms;
      case 1:
        return SmsType.Image;
    }
    return SmsType.Sms;
  }

  Map<String, dynamic> toJson() {
    var uuid = Uuid();
    final idRoom = uuid.v1();
    final map = <String, dynamic>{};
    map['message_id'] = idRoom;
    map['message_type_id'] = loaiTinNhan;
    map['create_at'] = DateTime.now().millisecondsSinceEpoch;
    map['sender_id'] = idUser;
    map['content'] = content;
    map['channel_id'] = id;
    return map;
  }

  MessageSmsModel.fromJson(Map<String, dynamic> json) {
    id = json['message_id'];
    senderId = json['sender_id'];
    content = json['content'];
    loaiTinNhan = json['message_type_id'];
    smsType = fromEnum(loaiTinNhan ?? 0);
  }
}
