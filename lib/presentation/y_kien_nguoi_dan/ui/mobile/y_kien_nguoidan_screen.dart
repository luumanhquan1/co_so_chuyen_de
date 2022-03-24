import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/data/exception/app_exception.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/nguoi_dan_model.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/yknd_dash_board_item.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/calender_work/ui/mobile/widget/custom_item_calender_work.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_yknd/ui/mobile/chi_tiet_yknd_screen.dart';
import 'package:ccvc_mobile/presentation/danh_sach_y_kien_nd/ui/mobile/danh_sach_yknd_screen.dart';
import 'package:ccvc_mobile/presentation/quan_li_van_ban/ui/widgets/box_satatus_vb.dart';
import 'package:ccvc_mobile/presentation/y_kien_nguoi_dan/block/y_kien_nguoidan_cubit.dart';
import 'package:ccvc_mobile/presentation/y_kien_nguoi_dan/ui/mobile/widgets/indicator_chart.dart';
import 'package:ccvc_mobile/presentation/y_kien_nguoi_dan/ui/mobile/widgets/y__kien_nguoi_dan_item.dart';
import 'package:ccvc_mobile/presentation/y_kien_nguoi_dan/ui/mobile/widgets/y_kien_nguoi_dan_menu.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/views/state_stream_layout.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:ccvc_mobile/widgets/appbar/base_app_bar.dart';
import 'package:ccvc_mobile/widgets/calendar/table_calendar/table_calendar_widget.dart';
import 'package:ccvc_mobile/widgets/chart/base_pie_chart.dart';
import 'package:ccvc_mobile/widgets/drawer/drawer_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class YKienNguoiDanScreen extends StatefulWidget {
  const YKienNguoiDanScreen({Key? key}) : super(key: key);

  @override
  _YKienNguoiDanScreenState createState() => _YKienNguoiDanScreenState();
}

class _YKienNguoiDanScreenState extends State<YKienNguoiDanScreen> {
  YKienNguoiDanCubitt cubit = YKienNguoiDanCubitt();

  @override
  void initState() {
    super.initState();
    cubit.initTimeRange();
    cubit.callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: S.current.thong_tin_chung,
        leadingIcon: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: SvgPicture.asset(
            ImageAssets.icBack,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              DrawerSlide.navigatorSlide(
                context: context,
                screen: YKienNguoiDanMenu(
                  cubit: cubit,
                ),
              );
            },
            icon: SvgPicture.asset(
              ImageAssets.ic_mennu_ykien,
            ),
          ),
        ],
      ),
      body: StateStreamLayout(
        textEmpty: S.current.khong_co_du_lieu,
        retry: () {},
        error: AppException('1', S.current.something_went_wrong),
        stream: cubit.stateStream,
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 130,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      S.current.thong_tin_y_kien_nguoi_dan,
                      style: textNormalCustom(
                        color: textTitle,
                        fontSize: 16,
                      ),
                    ),
                  ),
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
                          stream: cubit.listItemDashboard,
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
                                      data[index].numberOfCalendars ??0,
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
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StreamBuilder<List<ChartData>>(
                          stream: cubit.chartTinhHinhXuLy,
                          builder: (context, snapshot) {
                            final listDataChart = snapshot.data ?? [];
                            return PieChart(
                              title: S.current.tinh_hinh_y_kien_nguoi_dan,
                              chartData: listDataChart,
                              onTap: (int value) {},
                            );
                          },
                        ),
                        Container(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: BoxStatusVanBan(
                                value:
                                    cubit.dashboardModel.soLuongTrongHan ?? 0,
                                onTap: () {},
                                color: numberOfCalenders,
                                statusName: S.current.trong_han,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: BoxStatusVanBan(
                                value: cubit.dashboardModel.soLuongDenHan ?? 0,
                                onTap: () {},
                                color: labelColor,
                                statusName: S.current.den_han,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: BoxStatusVanBan(
                                value: cubit.dashboardModel.soLuongQuaHan ?? 0,
                                onTap: () {},
                                color: statusCalenderRed,
                                statusName: S.current.qua_han,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    color: homeColor,
                    height: 6,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      children: [
                        StreamBuilder<List<ChartData>>(
                          stream: cubit.chartPhanLoai,
                          builder: (context,snapshot){
                            final data=snapshot.data??[];
                            return PieChart(
                              isSubjectInfo: false,
                              title: S.current.phan_loai_nguon_yknd,
                              chartData: data,
                              onTap: (int value) {},
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: cubit.listIndicator.map((e) {
                            return IndicatorChart(itemIndicator: e);
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    color: homeColor,
                    height: 6,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.current.danh_sach_y_kien_nguoi_Dan,
                              style: textNormalCustom(
                                fontSize: 16,
                                color: textDropDownColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        const DanhSachYKND(),
                                  ),
                                );
                              },
                              icon: SvgPicture.asset(ImageAssets.ic_next_color),
                            )
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cubit.listYKienNguoiDan.length < 3
                              ? cubit.listYKienNguoiDan.length
                              : 3,
                          itemBuilder: (context, index) {
                            return YKienNguoiDanCell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ChiTietYKNDScreen(),
                                  ),
                                );
                              },
                              title:
                                  cubit.listYKienNguoiDan[index].ngheNghiep ??
                                      '',
                              dateTime:
                                  cubit.listYKienNguoiDan[index].ngayThang ??
                                      '',
                              userName:
                                  cubit.listYKienNguoiDan[index].ten ?? '',
                              stausColor: cubit
                                  .listYKienNguoiDan[index].statusData
                                  .getText()
                                  .color,
                              status: cubit.listYKienNguoiDan[index].statusData
                                  .getText()
                                  .text,
                              userImage:
                                  'https://th.bing.com/th/id/OIP.A44wmRFjAmCV90PN3wbZNgHaEK?pid=ImgDet&rs=1',
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TableCalendarWidget(
              onChangeRange:
                  (DateTime? start, DateTime? end, DateTime? focusedDay) {
                cubit.startDate = start?.toStringWithListFormat ??
                    DateTime.now().toStringWithListFormat;
                cubit.endDate = end?.toStringWithListFormat ??
                    DateTime.now().toStringWithListFormat;
                cubit.callApi();
              },
              onChange:
                  (DateTime startDate, DateTime endDate, DateTime selectDay) {
                cubit.startDate = startDate.toStringWithListFormat;
                cubit.endDate = endDate.toStringWithListFormat;
                cubit.callApi();
              },
            ),
          ],
        ),
      ),
    );
  }
}
