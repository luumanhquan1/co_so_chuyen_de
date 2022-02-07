import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/presentation/calender_work/calender_work_day/bloc/calender_cubit.dart';
import 'package:ccvc_mobile/presentation/calender_work/calender_work_day/ui/calender_work_day_list/mobile/widget/custom_item_calender_work.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderFormMonth extends StatefulWidget {
  const CalenderFormMonth({Key? key}) : super(key: key);

  @override
  _CalenderFormMonthState createState() => _CalenderFormMonthState();
}

class _CalenderFormMonthState extends State<CalenderFormMonth> {
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
            todayHighlightColor: labelColor,
            appointmentTimeTextFormat: 'hh:mm:ss a',
            dataSource: _cubit.getCalenderDataSource(),
            selectionDecoration: const BoxDecoration(color: Colors.transparent),
            appointmentBuilder: (
              BuildContext context,
              CalendarAppointmentDetails calendarAppointmentDetails,
            ) {
              final Appointment appointment =
                  calendarAppointmentDetails.appointments.first;
              // final distanceTime =
              //     appointment.startTime.difference(appointment.endTime);
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: textColorMangXaHoi,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 2.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          appointment.subject,
                          style: textNormalCustom(),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Flexible(
                        child: Text(
                          '${appointment.startTime.toStringWithAMPM}'
                          ' - ${appointment.endTime.toStringWithAMPM}',
                          style: textNormalCustom(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
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
      ],
    );
  }
}
