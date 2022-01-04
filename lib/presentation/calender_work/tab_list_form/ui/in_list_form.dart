import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/domain/model/dashboard_schedule.dart';
import 'package:ccvc_mobile/presentation/calender_work/bloc/calender_cubit.dart';
import 'package:ccvc_mobile/presentation/calender_work/widget/custom_item_calender_list.dart';
import 'package:ccvc_mobile/presentation/calender_work/widget/custom_item_calender_work.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InListForm extends StatefulWidget {
  const InListForm({Key? key}) : super(key: key);

  @override
  _InListFormState createState() => _InListFormState();
}

class _InListFormState extends State<InListForm> {
  final CalenderCubit _cubit = CalenderCubit();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 88,
                width: MediaQuery.of(context).size.width - 16,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: _cubit.list.length,
                  itemBuilder: (context, index) {
                    if (_cubit.list.length == 5) {
                      _cubit.list.insert(
                          0,
                          DashboardSchedule(
                              6, "22ssdssads2", "Tổng số lịch làm việc"));
                    }
                    return CustomItemCalenderWork(
                        image: _cubit.img[index],
                        typeName: _cubit.list[index].typeName,
                        numberOfCalendars:
                            _cubit.list[index].numberOfCalendars);
                  },
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 16.0, top: 16.0, bottom: 16.0),
              child: Text(
                _cubit.currentTime,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: textBodyTime, fontSize: 14.0),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: _cubit.listMeeting.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: CustomItemCalenderList(
                      title: _cubit.listMeeting[index].title,
                      dateTimeFrom:
                          DateTime.parse(_cubit.listMeeting[index].dateTimeFrom)
                              .toStringWithAMPM,
                      dateTimeTo:
                          DateTime.parse(_cubit.listMeeting[index].dateTimeTo)
                              .toStringWithAMPM,
                      urlImage:
                          "https://th.bing.com/th/id/R.91e66c15f578d577c2b40dcf097f6a98?rik=41oluNFG8wUvYA&pid=ImgRaw&r=0"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
