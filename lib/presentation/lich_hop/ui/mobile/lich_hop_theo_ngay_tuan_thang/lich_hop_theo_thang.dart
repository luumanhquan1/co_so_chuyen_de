import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/danh_sach_lich_hop.dart';
import 'package:ccvc_mobile/presentation/lich_hop/bloc/lich_hop_cubit.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class LichHopTheoThang extends StatefulWidget {
  final LichHopCubit cubit;

  const LichHopTheoThang({Key? key, required this.cubit}) : super(key: key);

  @override
  _LichHopTheoThangState createState() => _LichHopTheoThangState();
}

class _LichHopTheoThangState extends State<LichHopTheoThang> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CalendarController>(
        stream: widget.cubit.stateCalendarSubject.stream,
        builder: (context, snapshot) {
          final data = snapshot.data ?? CalendarController();
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder<DanhSachLichHopModel>(
                stream: widget.cubit.danhSachLichHopStream,
                builder: (context, snapshot) {
                  return SfCalendar(
                    allowAppointmentResize: true,
                    controller: data,
                    headerHeight: 0.0,
                    appointmentTextStyle:
                        textNormalCustom(color: backgroundColorApp),
                    view: CalendarView.month,
                    todayHighlightColor: labelColor,
                    appointmentTimeTextFormat: 'hh:mm:ss a',
                    dataSource: widget.cubit.getCalenderDataSource(
                      snapshot.data ?? DanhSachLichHopModel.empty(),
                    ),
                    viewHeaderStyle: ViewHeaderStyle(
                      dayTextStyle: textNormalCustom(
                          fontSize: 13, color: unselectLabelColor),
                    ),
                    monthViewSettings: MonthViewSettings(
                      appointmentDisplayCount: 3,
                      monthCellStyle: MonthCellStyle(
                        trailingDatesTextStyle: textNormalCustom(
                            fontSize: 14, color: iconColorDown),
                        textStyle: textNormalCustom(
                            fontSize: 14, color: fontColorTablet2),
                      ),
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
                      return Padding(
                        padding: const EdgeInsets.only(left: 4, bottom: 2),
                        child: Container(
                          height: 500,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0),
                            color: textColorMangXaHoi,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 2.0,
                              vertical: 2.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    appointment.subject,
                                    style: textNormalCustom(fontSize: 8),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
          );
        });
  }
}
