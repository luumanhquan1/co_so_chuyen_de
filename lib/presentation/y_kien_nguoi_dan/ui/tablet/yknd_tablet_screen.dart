import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/data/exception/app_exception.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/y_kien_nguoi_dan%20_model.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/yknd_dash_board_item.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/calender_work/ui/mobile/widget/custom_item_calender_work.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_yknd/ui/mobile/chi_tiet_yknd_screen.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_yknd/ui/tablet/chi_tiet_yknd_tablet.dart';
import 'package:ccvc_mobile/presentation/choose_time/bloc/choose_time_cubit.dart';
import 'package:ccvc_mobile/presentation/choose_time/ui/choose_time_screen.dart';
import 'package:ccvc_mobile/presentation/danh_sach_y_kien_nd/ui/tablet/danh_sach_yknd_tablet.dart';
import 'package:ccvc_mobile/presentation/nhiem_vu/ui/tablet/widget/list_danh_sach_cong_viec.dart';
import 'package:ccvc_mobile/presentation/quan_li_van_ban/ui/widgets/box_satatus_vb.dart';
import 'package:ccvc_mobile/presentation/y_kien_nguoi_dan/block/y_kien_nguoidan_cubit.dart';
import 'package:ccvc_mobile/presentation/y_kien_nguoi_dan/ui/mobile/widgets/y__kien_nguoi_dan_item.dart';
import 'package:ccvc_mobile/presentation/y_kien_nguoi_dan/ui/tablet/widgets/menu_y_kien_nguoi_dan_tablet.dart';
import 'package:ccvc_mobile/presentation/y_kien_nguoi_dan/ui/tablet/widgets/row_indicator_tablet.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/views/state_stream_layout.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/appbar/base_app_bar.dart';
import 'package:ccvc_mobile/widgets/chart/base_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class YKNDScreenTablet extends StatefulWidget {
  const YKNDScreenTablet({Key? key}) : super(key: key);

  @override
  _YKNDScreenTabletState createState() => _YKNDScreenTabletState();
}

class _YKNDScreenTabletState extends State<YKNDScreenTablet>
    with SingleTickerProviderStateMixin {
  YKienNguoiDanCubitt cubit = YKienNguoiDanCubitt();
  ChooseTimeCubit chooseTimeScreen = ChooseTimeCubit();

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
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(
            ImageAssets.icBack,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuYKIenNguoiDanTablet(
                    cubit: cubit,
                  ),
                ),
              );
            },
            icon: SvgPicture.asset(ImageAssets.icMenuLichHopTablet),
          )
        ],
      ),
      body: StateStreamLayout(
        textEmpty: S.current.khong_co_du_lieu,
        retry: () {},
        error: AppException('1', S.current.something_went_wrong),
        stream: cubit.stateStream,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ChooseTimeScreen(
                today: DateTime.now(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 88,
                    child: StreamBuilder<List<YKienNguoiDanDashBroadItem>>(
                      stream: cubit.listItemDashboard,
                      builder: (context, snapshot) {
                        final data = snapshot.data ?? [];
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: cubit.list.length,
                          itemBuilder: (context, index) {
                            return CustomItemCalenderWork(
                              image: cubit.img[index],
                              typeName: cubit.list[index].typeName,
                              numberOfCalendars:
                                  cubit.list[index].numberOfCalendars,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: bgQLVBTablet,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: borderColor.withOpacity(0.5),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PieChart(
                                  isSubjectInfo: false,
                                  title: S.current.tinh_hinh_y_kien_nguoi_dan,
                                  chartData: cubit.chartPhanLoaiYKND,
                                  onTap: (int value) {},
                                ),
                                RowIndicatorSmallTablet(
                                  chartData: cubit.chartPhanLoaiYKND,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          Flexible(
                            flex: 6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PieChart(
                                  isSubjectInfo: false,
                                  title: S.current.phan_loai_yknd,
                                  chartData: cubit.chartYKienNduoiDan,
                                  onTap: (int value) {},
                                ),
                                RowIndicatorTablet(
                                  paddingleft: 0,
                                  chartData: cubit.chartYKienNduoiDanTablet,
                                ),
                                Container(height: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: 5,
                            child: Row(
                              children: [
                                Expanded(
                                  child: BoxStatusVanBan(
                                    value:
                                        cubit.dashboardModel.soLuongTrongHan ??
                                            0,
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
                                    value:
                                        cubit.dashboardModel.soLuongDenHan ?? 0,
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
                                    value:
                                        cubit.dashboardModel.soLuongQuaHan ?? 0,
                                    onTap: () {},
                                    color: statusCalenderRed,
                                    statusName: S.current.qua_han,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          Flexible(
                            flex: 6,
                            child: Row(
                              children: [
                                const Expanded(
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: BoxStatusVanBan(
                                          value: cubit.dashboardModel
                                                  .soLuongTrongHan ??
                                              0,
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
                                          value: cubit.dashboardModel
                                                  .soLuongDenHan ??
                                              0,
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
                                          value: cubit.dashboardModel
                                                  .soLuongQuaHan ??
                                              0,
                                          onTap: () {},
                                          color: statusCalenderRed,
                                          statusName: S.current.qua_han,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Expanded(
                                  child: SizedBox(),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.current.danh_sach_y_kien_nguoi_Dan,
                          style: textNormalCustom(
                            color: textTitle,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        buttonChitiet(S.current.xem_danh_sah_chi_tiet, () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DanhSachYKNDTablet(),
                            ),
                          );
                        }),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<List<YKienNguoiDanModel>>(
                      stream: cubit.danhSachYKienNguoiDan,
                      builder: (context, snapshot) {
                        final data = snapshot.data ?? [];
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: data.length < 3 ? data.length : 3,
                          itemBuilder: (context, index) {
                            return YKienNguoiDanCell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChiTietVanBanTabletScreen(
                                      iD: data[index].id,
                                      taskID: data[index].taskID,
                                    ),
                                  ),
                                );
                              },
                              title: data[index].tieuDe,
                              dateTime: data[index].ngayNhan,
                              userName:
                                  cubit.listYKienNguoiDan[index].ten ?? '',
                              status: data[index].soNgayToiHan,
                              userImage:
                                  'https://th.bing.com/th/id/OIP.A44wmRFjAmCV90PN3wbZNgHaEK?pid=ImgDet&rs=1',
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
