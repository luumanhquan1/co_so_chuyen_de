import 'package:ccvc_mobile/utils/constants/app_constants.dart';

class CalendarMeetingModel {
  final String title;
  final String time;
  final String address;
  final String nguoiChuTri;
  final DocumentStatus codeStatus;
  CalendarMeetingModel({
    required this.title,
    required this.time,
    required this.address,
    required this.codeStatus,
    required this.nguoiChuTri,
  });
}
