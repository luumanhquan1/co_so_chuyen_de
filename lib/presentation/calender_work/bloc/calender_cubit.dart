import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/dashboard_schedule.dart';
import 'package:ccvc_mobile/domain/model/meeting_schedule.dart';
import 'package:ccvc_mobile/presentation/calender_work/bloc/calender_state.dart';
import 'package:intl/intl.dart';

class CalenderCubit extends BaseCubit<CalenderState> {
  CalenderCubit() : super(CalenderStateIntial());

  List<String> img = [
    "tong_so_lich_lam_viec",
    "lich_cong_tac_trong_nuoc",
    "lich_lam_viec",
    "lich_cong_tac_nuoc_ngoai",
    "lich_tiep_dan",
    "admin_tao"
  ];
  List<DashboardSchedule> list = [
    DashboardSchedule(1, "22ssads2", "Lịch công tác trong nước"),
    DashboardSchedule(2, "2dasdsd22", "Lịch làm việc"),
    DashboardSchedule(3, "2dasda22", "Lịch công tác nước ngoài"),
    DashboardSchedule(4, "2asdas22", "Lịch tiếp dân"),
    DashboardSchedule(5, "sdasdasd", "admin tạo"),
  ];
  List<MeetingSchedule> listMeeting = [
    MeetingSchedule("hung", "2021-12-29T07:45:00", "2021-12-29T08:45:00"),
    MeetingSchedule("hung", "2021-12-29T09:45:00", "2021-12-29T10:45:00"),
    MeetingSchedule("hung", "2021-12-29T11:45:00", "2021-12-29T12:45:00"),
    MeetingSchedule("hung", "2021-12-29T13:45:00", "2021-12-29T15:45:00"),
  ];
  dynamic currentTime = DateFormat.yMMMEd().format(DateTime.now());
}