import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/data/exception/app_exception.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/yknd_dash_board_item.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/home_module/domain/model/home/document_dashboard_model.dart';
import 'package:ccvc_mobile/presentation/calender_work/ui/mobile/widget/custom_item_calender_work.dart';
import 'package:ccvc_mobile/presentation/danh_sach_y_kien_nd/ui/mobile/danh_sach_yknd_screen.dart';
import 'package:ccvc_mobile/presentation/quan_li_van_ban/ui/widgets/box_satatus_vb.dart';
import 'package:ccvc_mobile/presentation/y_kien_nguoi_dan/block/y_kien_nguoidan_cubit.dart';
import 'package:ccvc_mobile/presentation/y_kien_nguoi_dan/ui/mobile/widgets/indicator_chart.dart';
import 'package:ccvc_mobile/presentation/y_kien_nguoi_dan/ui/mobile/widgets/y_kien_nguoi_dan_menu.dart';
import 'package:ccvc_mobile/presentation/y_kien_nguoi_dan/ui/widget/bao_cao_thong_ke/bloc/bao_cao_thong_ke_cubit.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/views/state_stream_layout.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/appbar/base_app_bar.dart';
import 'package:ccvc_mobile/widgets/chart/base_pie_chart.dart';
import 'package:ccvc_mobile/widgets/drawer/drawer_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BaoCaoThongKeScreen extends StatefulWidget {
  const BaoCaoThongKeScreen({Key? key}) : super(key: key);

  @override
  _BaoCaoThongKeScreenState createState() => _BaoCaoThongKeScreenState();
}

class _BaoCaoThongKeScreenState extends State<BaoCaoThongKeScreen> {
  BaoCaoThongKeYKNDCubit baoCaoCubit=BaoCaoThongKeYKNDCubit();

  @override
  void initState() {
    super.initState();
    baoCaoCubit.baoCaoYKND('01/03/2022', '28/03/2022');
    baoCaoCubit.dashBoardBaoCaoYKND('01/03/2022', '28/03/2022');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: S.current.bao_cao_thong_ke,
        leadingIcon: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: SvgPicture.asset(
            ImageAssets.icBack,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(ImageAssets.ic_search_calendar),
          ),
          IconButton(
            onPressed: () {
              // DrawerSlide.navigatorSlide(
              //   context: context,
              //   screen: YKienNguoiDanMenu(
              //     cubit: cubit,
              //   ),
              // );
            },
            icon: SvgPicture.asset(ImageAssets.icMenuCalender),
          ),
        ],
      ),
      body: StateStreamLayout(
        textEmpty: S.current.khong_co_du_lieu,
        retry: () {},
        error: AppException('1', S.current.something_went_wrong),
        stream: baoCaoCubit.stateStream,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 16.0,
                    ),
                    height: 88,
                    child: StreamBuilder<List<YKienNguoiDanDashBroadItem>>(
                      stream: baoCaoCubit.listBaoCaoYKND,
                      builder: (context, snapshot) {
                        final data = snapshot.data ?? [];
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return CustomItemCalenderWork(
                              image: data[index].img ?? '',
                              typeName: data[index].typeName ?? '',
                              numberOfCalendars:
                                  data[index].numberOfCalendars ?? 0,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                height: 6,
                color: homeColor,
              ),
              // Container(
              //   padding: const EdgeInsets.only(left: 16),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       StreamBuilder<List<ChartData>>(
              //         stream: cubit.chartTinhHinhXuLy,
              //         builder: (context, snapshot) {
              //           final listDataChart = snapshot.data ?? [];
              //           return PieChart(
              //             title: S.current.tinh_hinh_y_kien_nguoi_dan,
              //             chartData: listDataChart,
              //             onTap: (int value) {},
              //           );
              //         },
              //       ),
              //       Container(height: 20),
              //       StreamBuilder<DocumentDashboardModel>(
              //         stream: cubit.statusTinhHinhXuLyData,
              //         builder: (context, snapshot) {
              //           final data = snapshot.data ?? DocumentDashboardModel();
              //           return Row(
              //             children: [
              //               Expanded(
              //                 child: BoxStatusVanBan(
              //                   value: data.soLuongTrongHan ?? 0,
              //                   onTap: () {},
              //                   color: numberOfCalenders,
              //                   statusName: S.current.trong_han,
              //                 ),
              //               ),
              //               const SizedBox(
              //                 width: 16,
              //               ),
              //               Expanded(
              //                 child: BoxStatusVanBan(
              //                   value: data.soLuongDenHan ?? 0,
              //                   onTap: () {},
              //                   color: labelColor,
              //                   statusName: S.current.den_han,
              //                 ),
              //               ),
              //               const SizedBox(
              //                 width: 16,
              //               ),
              //               Expanded(
              //                 child: BoxStatusVanBan(
              //                   value: data.soLuongQuaHan ?? 0,
              //                   onTap: () {},
              //                   color: statusCalenderRed,
              //                   statusName: S.current.qua_han,
              //                 ),
              //               ),
              //             ],
              //           );
              //         },
              //       ),
              //     ],
              //   ),
              // ),

            ],
          ),
        ),
      ),
    );
  }
}
