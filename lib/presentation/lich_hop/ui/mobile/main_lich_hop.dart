import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/lich_hop.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/lich_hop_item.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/calender_work/widget/custom_item_calender_work.dart';
import 'package:ccvc_mobile/presentation/lich_hop/bloc/lich_hop_cubit.dart';
import 'package:ccvc_mobile/presentation/lich_hop/bloc/lich_hop_cubit.dart';
import 'package:ccvc_mobile/presentation/lich_hop/bloc/lich_hop_state.dart';
import 'package:ccvc_mobile/presentation/lich_hop/ui/mobile/lich_hop_theo_ngay_tuan_thang/lich_hop_theo_tuan.dart';
import 'package:ccvc_mobile/presentation/lich_hop/ui/widget/choose_day_week_month.dart';
import 'package:ccvc_mobile/presentation/lich_hop/ui/widget/fake_drawer_lich_hop.dart';
import 'package:ccvc_mobile/presentation/lich_hop/ui/widget/widget_item_lich_hop.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_with_two_leading.dart';
import 'package:ccvc_mobile/widgets/calendar/table_calendar/table_calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'lich_hop_theo_danh_sach/lich_hop_theo_danh_sach_ngay.dart';
import 'lich_hop_theo_ngay_tuan_thang/lich_hop_theo_ngay.dart';

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
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  reverseTransitionDuration: const Duration(milliseconds: 250),
                  transitionDuration: const Duration(milliseconds: 250),
                  pageBuilder: (_, animation, ___) {
                    const begin = Offset(-1.0, 0.0);
                    const end = Offset.zero;
                    final tween = Tween(begin: begin, end: end);
                    final offsetAnimation = animation.drive(tween);
                    return FakeDrawerLichHop(
                      offsetAnimation: offsetAnimation,
                      title1: 'lich theo dang lich',
                      title2: 'lich theo dang list',
                      image1: ImageAssets.icMenuCalender,
                      image2: ImageAssets.icMenuCalender,
                      ontap1: () {
                        setState(() {
                          cubit.chooseTypeList(
                              Type_Choose_Option_List.DANG_LICH);
                          Navigator.pop(context);
                        });
                      },
                      ontap2: () {
                        setState(() {
                          cubit.chooseTypeList(
                              Type_Choose_Option_List.DANG_LIST);
                          Navigator.pop(context);
                        });
                      },
                    );
                  },
                  opaque: false,
                ),
              );
            },
            icon: SvgPicture.asset(ImageAssets.icMenuCalender),
          )
        ],
      ),
      body: Container(
        color: backgroundColorApp,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    margin: EdgeInsets.only(top: cubit.isCheckNgay ? 160 : 120),
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
                Expanded(
                  child: BlocBuilder<LichHopCubit, LichHopState>(
                    bloc: cubit,
                    builder: (context, state) {
                      if (state is LichHopStateDangList) {
                        if (state.type == Type_Choose_Option_Day.DAY) {
                          return LichHopTheoDanhSachNgay();
                        } else if (state.type == Type_Choose_Option_Day.WEEK) {
                          return LichHopTheoDanhSachNgay();
                        } else if (state.type == Type_Choose_Option_Day.MONTH) {
                          return LichHopTheoDanhSachNgay();
                        }
                        return SizedBox();
                      } else if (state is LichHopStateDangLich) {
                        if (state.type == Type_Choose_Option_Day.DAY) {
                          return const LichHopTheoNgay();
                        } else if (state.type == Type_Choose_Option_Day.WEEK) {
                          return const LichHopTheoTuan();
                        } else if (state.type == Type_Choose_Option_Day.MONTH) {
                          return const LichHopTheoTuan();
                        }
                        return SizedBox();
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                if (cubit.isCheckNgay)
                  BlocBuilder(
                    bloc: cubit,
                    builder: (context, state) {
                      return ChooseDayWeedMonth(
                        onTapDay: () {
                          setState(() {});
                          print(cubit.state);
                          cubit.chooseTypeDay(Type_Choose_Option_Day.DAY);
                        },
                        onTapWeek: () {
                          setState(() {});
                          print(cubit.state);
                          cubit.chooseTypeDay(Type_Choose_Option_Day.WEEK);
                        },
                        onTapmonth: () {
                          setState(() {
                            print(cubit.state);
                          });
                          cubit.chooseTypeDay(Type_Choose_Option_Day.MONTH);
                        },
                      );
                    },
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
