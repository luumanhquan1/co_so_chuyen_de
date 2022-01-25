import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/meeting_schedule.dart';
import 'package:ccvc_mobile/presentation/calender_work/bloc/calender_cubit.dart';
import 'package:ccvc_mobile/presentation/lich_hop/bloc/lich_hop_state.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

enum Type_Choose_Option_Day {
  DAY,
  WEEK,
  MONTH,
}
enum Type_Choose_Option_List {
  // DANH_SACH,
  DANG_LICH,
  DANG_LIST,
}

class LichHopCubit extends BaseCubit<LichHopState> {
  bool isCheckNgay = false;
  bool chooseDay = false;
  bool chooseWeed = false;
  bool chooseMonth = false;
  late BuildContext context;

  LichHopCubit() : super(LichHopStateIntial());
  List<String> listImageLichHopCuaToi = [
    ImageAssets.icLichCongTacTrongNuoc,
    ImageAssets.lichCanKlch,
    ImageAssets.lichSapToi,
    ImageAssets.icLichCongTacNuocNgoai,
  ];

  dynamic currentTime = DateFormat.yMMMEd().format(DateTime.now());
  List<MeetingSchedule> listMeeting = [
    MeetingSchedule("hung", "2022-01-26T07:45:00", "2022-01-26T08:45:00"),
    MeetingSchedule("hung", "2022-01-26T09:45:00", "2022-01-26T10:45:00"),
    MeetingSchedule("hung", "2022-01-26T11:45:00", "2022-01-26T12:45:00"),
    MeetingSchedule("hung", "2022-01-26T13:45:00", "2022-01-26T15:45:00"),
  ];
  DataSource getCalenderDataSource() {
    List<Appointment> appointments = [];
    RecurrenceProperties recurrence =
    RecurrenceProperties(startDate: DateTime.now());
    recurrence.recurrenceType = RecurrenceType.daily;
    recurrence.interval = 2;
    recurrence.recurrenceRange = RecurrenceRange.noEndDate;
    recurrence.recurrenceCount = 10;
    for (int i = 0; i < listMeeting.length; i++) {
      appointments.add(Appointment(
        startTime: DateTime.parse(listMeeting[i].dateTimeFrom),
        endTime: DateTime.parse(listMeeting[i].dateTimeTo),
        subject: listMeeting[i].title,
        color: Colors.blue,
      ));
    }
    return DataSource(appointments);
  }

  chooseTypeList(Type_Choose_Option_List type) {
    if (type == Type_Choose_Option_List.DANG_LICH) {
      emit(const LichHopStateDangLich(Type_Choose_Option_List.DANG_LICH));
    } else if(type == Type_Choose_Option_List.DANG_LIST) {
      emit(const LichHopStateDangList(Type_Choose_Option_List.DANG_LIST));
    }
  }
    // chooseTypeDay(Type_Choose_Option_Day type) {
    //   if (type == Type_Choose_Option_Day.DAY) {
    //     emit(const LichHopStateDay(Type_Choose_Option_Day.DAY));
    //   }
    //   else if(type==Type_Choose_Option_Day.WEEK){
    //     emit(const LichHopStateDay(Type_Choose_Option_Day.WEEK));
    //   }else{
    //     emit(const LichHopStateDay(Type_Choose_Option_Day.MONTH));
    //   }
    // }
  }
