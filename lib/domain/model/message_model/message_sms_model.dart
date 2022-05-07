enum SmsType { Sms, Image }

class MessageSmsModel {
  final String id;
  final bool isMe;
  final String content;
  final int loaiTinNhan;
  SmsType smsType = SmsType.Sms;
  MessageSmsModel(
      {required this.id,
      required this.isMe,
      required this.content,
      required this.loaiTinNhan}) {
    smsType = fromEnum();
  }
  SmsType fromEnum() {
    switch (loaiTinNhan) {
      case 0:
        return SmsType.Sms;
      case 1:
        return SmsType.Image;
    }
    return SmsType.Sms;
  }
}
