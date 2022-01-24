import 'package:ccvc_mobile/domain/model/lich_hop/lich_hop.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/lich_hop_item.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/calender_work/widget/custom_item_calender_work.dart';
import 'package:ccvc_mobile/presentation/lich_hop/bloc/lich_hop_cubit.dart';
import 'package:ccvc_mobile/presentation/lich_hop/ui/widget/widget_item_lich_hop.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_with_two_leading.dart';
import 'package:ccvc_mobile/widgets/calendar/table_calendar/table_calendar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LichHopCuaToi extends StatefulWidget {
  const LichHopCuaToi({Key? key}) : super(key: key);

  @override
  _LichHopCuaToiState createState() => _LichHopCuaToiState();
}

class _LichHopCuaToiState extends State<LichHopCuaToi> {
  LichHopCubit cubit=LichHopCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithTwoLeading(
        title: S.current.lich_hop_cua_toi,
        leadingIcon: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                ImageAssets.icBack,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                ImageAssets.icDayMonth,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(ImageAssets.icMenuCalender),
          )
        ],
      ),
      body: Padding(
        padding:  const EdgeInsets.only(right: 16.0, top: 16.0, left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 88,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: listItemSchedule.length,
                itemBuilder: (context,index){
                  return CustomItemCalenderWork(
                    image: cubit.listImageLichHopCuaToi[index],
                    typeName: listItemSchedule[index].typeName,
                    numberOfCalendars: listItemSchedule[index].numberOfSchedule,
                  );
                },
              ),
            ),


            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: listLichHop.length,
                itemBuilder: (context, index) {
                  return WidgetItemLichHop(
                    ontap: () {},
                    title:listLichHop[index].title,
                    dateTimeFrom: DateTime.parse(
                      listLichHop[index].dateTimeFrom,
                    ).toStringWithAMPM,
                    dateTimeTo:
                    DateTime.parse(listLichHop[index].dateTimeTo)
                        .toStringWithAMPM,
                    urlImage: listLichHop[index].urlImage,
                  );
                },
              ),
            ),
            const TableCalendarWidget(),
          ],
        )
      ),
    );
  }
}
