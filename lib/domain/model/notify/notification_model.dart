import 'package:ccvc_mobile/presentation/notification/bloc/screen_stype.dart';

class NotificationModel {
  String name;
  String detailId;
  ScreenType screenType;
  DateTime createBy;
  bool isRead;

  NotificationModel({
    required this.name,
    required this.detailId,
    required this.screenType,
    required this.createBy,
    required this.isRead,
  });
}
