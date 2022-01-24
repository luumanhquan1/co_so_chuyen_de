import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/dashboard_schedule.dart';
import 'package:ccvc_mobile/presentation/calender_work/calender_work_day/calender_work_day_list/mobile/bloc/calender_cubit.dart';
import 'package:ccvc_mobile/presentation/calender_work/calender_work_day/calender_work_day_list/mobile/widget/custom_item_calender_work.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class InCalenderForm extends StatefulWidget {
  const InCalenderForm({Key? key}) : super(key: key);

  @override
  _InCalenderFormState createState() => _InCalenderFormState();
}

class _InCalenderFormState extends State<InCalenderForm> {
  final CalendarController _controller = CalendarController();
  final CalenderCubit _cubit = CalenderCubit();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
      child: Stack(
        children: [
          Positioned(
            top: -12.0,
            bottom: 0,
            child: SfCalendar(
              controller: _controller,
              appointmentTextStyle: textNormalCustom(color: backgroundColorApp),
              todayHighlightColor: statusCalenderRed,
              appointmentTimeTextFormat: 'hh:mm:ss a',
              dataSource: _cubit.getCalenderDataSource(),
              appointmentBuilder: (
                BuildContext context,
                CalendarAppointmentDetails calendarAppointmentDetails,
              ) {
                final Appointment appointment =
                    calendarAppointmentDetails.appointments.first;
                return Container(
                  width: calendarAppointmentDetails.bounds.width,
                  height: calendarAppointmentDetails.bounds.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.blue,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            appointment.subject,
                            style: textNormalCustom(),
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Flexible(
                          child: Text(
                            '${appointment.startTime.toStringWithAMPM} -'
                            '${appointment.endTime.toStringWithAMPM}',
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
          SingleChildScrollView(
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
                  if (_cubit.list.length == 5) {
                    _cubit.list.insert(
                      0,
                      DashboardSchedule(
                        6,
                        '22ssdssads2',
                        'Tổng số lịch làm việc',
                      ),
                    );
                  }
                  return CustomItemCalenderWork(
                    image: _cubit.img[index],
                    typeName: _cubit.list[index].typeName,
                    numberOfCalendars: _cubit.list[index].numberOfCalendars,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
