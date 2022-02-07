import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/presentation/calender_work/calender_work_day/bloc/calender_cubit.dart';
import 'package:ccvc_mobile/presentation/calender_work/calender_work_day/ui/calender_work_day_list/mobile/widget/custom_item_calender_work.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderFormLichMonthTablet extends StatefulWidget {
  const CalenderFormLichMonthTablet({Key? key}) : super(key: key);

  @override
  _CalenderFormLichMonthTabletState createState() =>
      _CalenderFormLichMonthTabletState();
}

class _CalenderFormLichMonthTabletState
    extends State<CalenderFormLichMonthTablet> {
  final CalendarController _controller = CalendarController();
  final CalenderCubit _cubit = CalenderCubit();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        spaceH16,
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              color: backgroundColorApp,
              height: 88,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _cubit.list.length,
                itemBuilder: (context, index) {
                  return CustomItemCalenderWork(
                    image: _cubit.img[index],
                    typeName: _cubit.list[index].typeName,
                    numberOfCalendars: _cubit.list[index].numberOfCalendars,
                  );
                },
              ),
            ),
          ),
        ),
        spaceH16,
        Expanded(
          child: SfCalendar(
            allowAppointmentResize: true,
            controller: _controller,
            headerHeight: 0.0,
            appointmentTextStyle: textNormalCustom(color: backgroundColorApp),
            view: CalendarView.month,
            monthCellBuilder: monthCellBuilder,
            todayHighlightColor: labelColor,
            appointmentTimeTextFormat: 'hh:mm:ss a',
            dataSource: _cubit.getCalenderDataSource(),
            viewHeaderStyle: ViewHeaderStyle(
              dayTextStyle:
                  textNormalCustom(fontSize: 13, color: unselectLabelColor),
            ),
            monthViewSettings: MonthViewSettings(
              showTrailingAndLeadingDates: false,
              appointmentDisplayCount: 3,
              monthCellStyle: MonthCellStyle(
                trailingDatesTextStyle:
                    textNormalCustom(fontSize: 14, color: iconColorDown),
                textStyle:
                    textNormalCustom(fontSize: 14, color: fontColorTablet2),
              ),
              // numberOfWeeksInView: 4,
              //showTrailingAndLeadingDates: false,
              //showAgenda: true,
              appointmentDisplayMode: MonthAppointmentDisplayMode.none,
            ),
            selectionDecoration: const BoxDecoration(color: Colors.transparent),
            // appointmentBuilder: (
            //   BuildContext context,
            //   CalendarAppointmentDetails calendarAppointmentDetails,
            // ) {
            //   final Appointment appointment =
            //       calendarAppointmentDetails.appointments.first;
            //   // final distanceTime =
            //   //     appointment.startTime.difference(appointment.endTime);
            //   return Padding(
            //     padding: const EdgeInsets.only(left: 4, bottom: 2),
            //     child: Container(
            //       height: 500,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(2.0),
            //         color: textColorMangXaHoi,
            //       ),
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(
            //           horizontal: 2.0,
            //           vertical: 2.0,
            //         ),
            //         child: Column(
            //           children: [
            //             Flexible(
            //               child: Text(
            //                 appointment.subject,
            //                 style: textNormalCustom(fontSize: 8),
            //                 overflow: TextOverflow.ellipsis,
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //   );
            // },
          ),
        ),
      ],
    );
  }

  Widget monthCellBuilder(BuildContext context, MonthCellDetails details) {
    if (details.appointments.isNotEmpty) {
      final Appointment appointment = details.appointments[0] as Appointment;
      return Container(
        color: appointment.color,
        child: Text(appointment.subject),
      );
    }
    return Container(
      color: Colors.blueGrey,
      child: Text(details.date.day.toString()),
    );
  }
}
