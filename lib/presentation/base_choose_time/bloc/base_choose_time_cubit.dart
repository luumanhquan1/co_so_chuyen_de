import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/presentation/base_choose_time/bloc/base_choose_time_state.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

class BaseChooseTimeCubit extends BaseCubit<BaseChooseTimeState> {
  BaseChooseTimeCubit() : super(BaseChooseTimeInitial());

  //
  bool isCheck = false;
  List<String> listText = ['Ngày', 'Tuần', 'Tháng'];
  String textContent = 'Ngày';

  //
  DateTime now = DateTime.now();
  String textDisplayTime = '';
  String changeOption = 'Ngày';
  BehaviorSubject<String> textDateTimeSubject = BehaviorSubject();
  BehaviorSubject<DateTime> dateSubject = BehaviorSubject();

  Stream<String> get textDateTimeStream => textDateTimeSubject.stream;

  Stream<DateTime> get toDateStream => dateSubject.stream;

  void getState(DateTime time) {
    textDisplayTime = getDateToString(time);
    textDateTimeSubject.sink.add(textDisplayTime);
  }

  void onNextDay() {
    int a = now.millisecondsSinceEpoch;
    a = a + (24 * 60 * 60 * 1000);
    now = DateTime.fromMillisecondsSinceEpoch(a);
    textDisplayTime = getDateToString(now);
    textDateTimeSubject.sink.add(textDisplayTime);
  }

  String getDateToString(DateTime time, [DateTime? endDate]) {
    String day;
    String month;
    if (time.day < 10) {
      day = '0${time.day}';
    } else {
      day = '${time.day}';
    }
    if (time.month < 10) {
      month = '0${time.month}';
    } else {
      month = '${time.month}';
    }

    //
    if (endDate != null) {
      // endDate
      String dayEnd;
      String monthEnd;
      if (endDate.day < 10) {
        dayEnd = '0${endDate.day}';
      } else {
        dayEnd = '${endDate.day}';
      }
      if (endDate.month < 10) {
        monthEnd = '0${endDate.month}';
      } else {
        monthEnd = '${endDate.month}';
      }
      if (changeOption == 'Tuần') {
        return '$day,$month - $dayEnd Tháng $monthEnd, ${endDate.year}';
      } else {
        return '$day - $dayEnd Tháng $monthEnd, ${endDate.year}';
      }
    }
    return '$day Tháng $month,${time.year}';
    //
  }

  void onBackDay() {
    int a = now.millisecondsSinceEpoch;
    a = a - (24 * 60 * 60 * 1000);
    now = DateTime.fromMillisecondsSinceEpoch(a);
    textDisplayTime = getDateToString(now);
    textDateTimeSubject.sink.add(textDisplayTime);
  }

  void ontoDay() {
    final DateTime today = DateTime.now();
    textDisplayTime = getDateToString(today);
    textDateTimeSubject.sink.add(textDisplayTime);
  }

  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  void onNextWeek() {
    int b = now.millisecondsSinceEpoch;
    b = b + (7 * 24 * 60 * 60 * 1000);
    now = DateTime.fromMillisecondsSinceEpoch(b);
    final String a = DateFormat(DateFormat.WEEKDAY).format(now); // Tues
    final weekDay = now.weekday == 7 ? 0 : now.weekday;
    if (a == 'Sunday') {
      textDisplayTime = getDateToString(
        DateTime.fromMillisecondsSinceEpoch(
          getDate(
            now.subtract(
              Duration(days: DateTime.daysPerWeek - weekDay - 1),
            ),
          ).millisecondsSinceEpoch,
        ),
        DateTime.fromMillisecondsSinceEpoch(
          getDate(now.subtract(Duration(days: weekDay))).millisecondsSinceEpoch,
        ),
      );
      textDateTimeSubject.sink.add(textDisplayTime);
    } else {
      textDisplayTime = getDateToString(
        DateTime.fromMillisecondsSinceEpoch(
          getDate(now.subtract(Duration(days: weekDay)))
                  .millisecondsSinceEpoch +
              (24 * 60 * 60 * 1000),
        ),
        DateTime.fromMillisecondsSinceEpoch(
          getDate(now.add(Duration(days: DateTime.daysPerWeek - weekDay - 1)))
                  .millisecondsSinceEpoch +
              (24 * 60 * 60 * 1000),
        ),
      );
      textDateTimeSubject.sink.add(textDisplayTime);
    }
  }

  void onBackWeek() {
    int b = now.millisecondsSinceEpoch;
    b = b - (7 * 24 * 60 * 60 * 1000);
    now = DateTime.fromMillisecondsSinceEpoch(b);
    final String a = DateFormat(DateFormat.WEEKDAY).format(now); // Tues
    final weekDay = now.weekday == 7 ? 0 : now.weekday;
    if (a == 'Sunday') {
      textDisplayTime = getDateToString(
        DateTime.fromMillisecondsSinceEpoch(
          getDate(
            now.subtract(
              Duration(days: DateTime.daysPerWeek - weekDay - 1),
            ),
          ).millisecondsSinceEpoch,
        ),
        DateTime.fromMillisecondsSinceEpoch(
          getDate(now.subtract(Duration(days: weekDay))).millisecondsSinceEpoch,
        ),
      );
      textDateTimeSubject.sink.add(textDisplayTime);
    } else {
      textDisplayTime = getDateToString(
        DateTime.fromMillisecondsSinceEpoch(
          getDate(now.subtract(Duration(days: weekDay)))
                  .millisecondsSinceEpoch +
              (24 * 60 * 60 * 1000),
        ),
        DateTime.fromMillisecondsSinceEpoch(
          getDate(now.add(Duration(days: DateTime.daysPerWeek - weekDay - 1)))
                  .millisecondsSinceEpoch +
              (24 * 60 * 60 * 1000),
        ),
      );
      textDateTimeSubject.sink.add(textDisplayTime);
    }
  }

  void onNextMonth() {
    final firstDayThisMonth = DateTime(now.year, now.month, now.day);
    final firstDayNextMonth = DateTime(
      firstDayThisMonth.year,
      firstDayThisMonth.month + 1,
      firstDayThisMonth.day,
    );
    final int c = firstDayNextMonth.difference(firstDayThisMonth).inDays;
    int b = now.millisecondsSinceEpoch;
    b = b + (c * 24 * 60 * 60 * 1000);
    now = DateTime.fromMillisecondsSinceEpoch(b);
    textDisplayTime = getDateToString(
      DateTime.fromMillisecondsSinceEpoch(
        DateTime.utc(
          now.year,
          now.month,
        ).millisecondsSinceEpoch,
      ),
      DateTime.fromMillisecondsSinceEpoch(
        DateTime.utc(
          now.year,
          now.month + 1,
        ).subtract(const Duration(days: 1)).millisecondsSinceEpoch,
      ),
    );
    textDateTimeSubject.sink.add(textDisplayTime);
  }

  void onBackMonth() {
    final firstDayThisMonth = DateTime(now.year, now.month, now.day);
    final firstDayNextMonth = DateTime(
      firstDayThisMonth.year,
      firstDayThisMonth.month + 1,
      firstDayThisMonth.day,
    );
    final int c = firstDayNextMonth.difference(firstDayThisMonth).inDays;
    int b = now.millisecondsSinceEpoch;
    b = b - (c * 24 * 60 * 60 * 1000);
    now = DateTime.fromMillisecondsSinceEpoch(b);
    textDisplayTime = getDateToString(
      DateTime.fromMillisecondsSinceEpoch(
        DateTime.utc(
          now.year,
          now.month,
        ).millisecondsSinceEpoch,
      ),
      DateTime.fromMillisecondsSinceEpoch(
        DateTime.utc(
          now.year,
          now.month + 1,
        ).subtract(const Duration(days: 1)).millisecondsSinceEpoch,
      ),
    );
    textDateTimeSubject.sink.add(textDisplayTime);
  }

  void checkToOption(String a) {
    switch (a) {
      case 'Ngày':
        onNextDay();
        break;
      case 'Tuần':
        onNextWeek();
        break;
      case 'Tháng':
        onNextMonth();
        break;
    }
  }

  void checkToOptionBackDay(String a) {
    switch (a) {
      case 'Ngày':
        onBackDay();
        break;
      case 'Tuần':
        onBackWeek();
        break;
      case 'Tháng':
        onBackMonth();
        break;
    }
  }

  void dispose() {
    textDateTimeSubject.close();
  }
}
