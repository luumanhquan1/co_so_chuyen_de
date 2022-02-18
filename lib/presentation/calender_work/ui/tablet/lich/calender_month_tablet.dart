import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/presentation/calender_work/bloc/calender_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderMonthTablet extends StatefulWidget {
  const CalenderMonthTablet({Key? key}) : super(key: key);

  @override
  _CalenderMonthTabletState createState() => _CalenderMonthTabletState();
}

class _CalenderMonthTabletState extends State<CalenderMonthTablet> {
  final CalendarController _controller = CalendarController();
  final CalenderCubit _cubit = CalenderCubit();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 28),
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 30),
              child: SfCalendar(
                allowAppointmentResize: true,
                controller: _controller,
                headerHeight: 0.0,
                view: CalendarView.month,
                todayHighlightColor: labelColor,
                appointmentTimeTextFormat: 'hh:mm:ss a',
                dataSource: _cubit.getCalenderDataSource(),
                viewHeaderStyle: ViewHeaderStyle(
                  dayTextStyle:
                      textNormalCustom(fontSize: 13, color: unselectLabelColor),
                ),
                monthViewSettings: MonthViewSettings(
                  showTrailingAndLeadingDates: false,
                  dayFormat: 'EEEE',
                  appointmentDisplayCount: 3,
                  monthCellStyle: MonthCellStyle(
                    backgroundColor: bgCalenderColor,
                    trailingDatesTextStyle:
                        textNormalCustom(fontSize: 14, color: iconColorDown),
                    textStyle:
                        textNormalCustom(fontSize: 14, color: fontColorTablet2),
                  ),
                  // numberOfWeeksInView: 4,
                  //showAgenda: true,
                  appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment,
                ),
                selectionDecoration:
                    const BoxDecoration(color: Colors.transparent),
                appointmentBuilder: (
                  BuildContext context,
                  CalendarAppointmentDetails calendarAppointmentDetails,
                ) {
                  final Appointment appointment =
                      calendarAppointmentDetails.appointments.first;
                  // final distanceTime =
                  //     appointment.startTime.difference(appointment.endTime);
                  return Padding(
                    padding: const EdgeInsets.only(left: 2, bottom: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                        color: textColorMangXaHoi,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                appointment.subject,
                                style: textNormalCustom(fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}