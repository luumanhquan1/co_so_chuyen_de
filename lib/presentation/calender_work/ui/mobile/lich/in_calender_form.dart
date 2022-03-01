import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/list_lich_lv/list_lich_lv_model.dart';
import 'package:ccvc_mobile/presentation/calender_work/bloc/calender_cubit.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class InCalenderForm extends StatefulWidget {
  final CalenderCubit cubit;

  const InCalenderForm({Key? key, required this.cubit}) : super(key: key);

  @override
  _InCalenderFormState createState() => _InCalenderFormState();
}

class _InCalenderFormState extends State<InCalenderForm> {
  final CalendarController _controller = CalendarController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.cubit.callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          spaceH16,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: StreamBuilder<DataLichLvModel>(
                stream: widget.cubit.streamListLich,
                builder: (context, snapshot) {
                  return SfCalendar(
                    viewHeaderHeight: 0,
                    allowViewNavigation: true,
                    headerHeight: 0,
                    controller: _controller,
                    appointmentTextStyle:
                        textNormalCustom(color: backgroundColorApp),
                    todayHighlightColor: statusCalenderRed,
                    timeSlotViewSettings: const TimeSlotViewSettings(
                      timeIntervalHeight: 54,
                    ),
                    selectionDecoration:
                        const BoxDecoration(color: Colors.transparent),
                    appointmentTimeTextFormat: 'hh:mm:ss a',
                    dataSource: widget.cubit.getCalenderDataSource(
                      snapshot.data ?? DataLichLvModel(),
                    ),
                    appointmentBuilder: (
                      BuildContext context,
                      CalendarAppointmentDetails calendarAppointmentDetails,
                    ) {
                      final Appointment appointment =
                          calendarAppointmentDetails.appointments.first;
                      return Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 6,
                            left: 8,
                            bottom: 6,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: textColorMangXaHoi,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  appointment.subject,
                                  style: textNormalCustom(fontSize: 12.0),
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Flexible(
                                child: Text(
                                  '${appointment.startTime.toStringWithAMPM} -'
                                  ' ${appointment.endTime.toStringWithAMPM}',
                                  style: textNormalCustom(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
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
