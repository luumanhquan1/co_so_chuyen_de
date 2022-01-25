import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/lich_hop.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/lich_hop_item.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/calender_work/widget/custom_item_calender_work.dart';
import 'package:ccvc_mobile/presentation/lich_hop/bloc/lich_hop_cubit.dart';
import 'package:ccvc_mobile/presentation/lich_hop/bloc/lich_hop_state.dart';
import 'package:ccvc_mobile/presentation/lich_hop/ui/widget/choose_day_week_month.dart';
import 'package:ccvc_mobile/presentation/lich_hop/ui/widget/widget_item_lich_hop.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_with_two_leading.dart';
import 'package:ccvc_mobile/widgets/calendar/table_calendar/table_calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MainLichHop extends StatefulWidget {
  const MainLichHop({Key? key}) : super(key: key);

  @override
  _MainLichHopState createState() => _MainLichHopState();
}

class _MainLichHopState extends State<MainLichHop> {
  LichHopCubit cubit = LichHopCubit();
  @override
  void initState() {
    super.initState();
    cubit.chooseTypeList(Type_Choose_Option_List.DANG_LIST);
  }
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
              onPressed: () {
                setState(() {});
                cubit.isCheckNgay = !cubit.isCheckNgay;
              },
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
      body: Container(
        color: backgroundColorApp,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      margin:
                          EdgeInsets.only(top: cubit.isCheckNgay ? 160 : 120),
                      height: 88,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: listItemSchedule.length,
                        itemBuilder: (context, index) {
                          return CustomItemCalenderWork(
                            image: cubit.listImageLichHopCuaToi[index],
                            typeName: listItemSchedule[index].typeName,
                            numberOfCalendars:
                                listItemSchedule[index].numberOfSchedule,
                          );
                        },
                      ),
                    ),
                  ),
                  BlocBuilder<LichHopCubit, LichHopState>(
                      bloc: cubit,
                      builder: (context, state) {
                        if (state is LichHopStateDangList) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16.0,
                                  right: 16.0,
                                  bottom: 16.0,
                                ),
                                child: Text(
                                  cubit.currentTime,
                                  style: textNormalCustom(color: textBodyTime),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: listLichHop.length,
                                  itemBuilder: (context, index) {
                                    return WidgetItemLichHop(
                                      ontap: () {},
                                      title: listLichHop[index].title,
                                      dateTimeFrom: DateTime.parse(
                                        listLichHop[index].dateTimeFrom,
                                      ).toStringWithAMPM,
                                      dateTimeTo: DateTime.parse(
                                              listLichHop[index].dateTimeTo)
                                          .toStringWithAMPM,
                                      urlImage: listLichHop[index].urlImage,
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        } else if (state is LichHopStateDangLich) {
                          return Center(
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.blue,
                            ),
                          );
                        } else {
                          return SizedBox();
                        }
                      }),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (cubit.isCheckNgay)
                  ChooseDayWeedMonth(
                    onTapDay: () {
                      setState(() {

                      });
                      cubit.chooseTypeList(Type_Choose_Option_List.DANG_LIST);
                    },
                    onTapWeek: () {
                      setState(() {

                      });
                      cubit.chooseTypeList(Type_Choose_Option_List.DANG_LICH);
                    },
                    onTapmonth: () {},
                  )
                else
                  const SizedBox(),
                const TableCalendarWidget(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        child: FloatingActionButton(
          elevation: 0.0,
          onPressed: () {},
          backgroundColor: labelColor,
          child: SvgPicture.asset(ImageAssets.icAddCalenderWhite),
        ),
      ),
    );
  }
}
