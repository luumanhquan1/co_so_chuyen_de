import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/danh_sach_cong_viec_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/danh_sach_nhiem_vu_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/bloc/nhiem_vu_cubit.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/ui/mobile/bloc/danh_sach_cubit.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/ui/mobile/danh_sach/danh_sach_cong_viec_mobile.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/ui/mobile/danh_sach/danh_sach_nhiem_vu_mobile.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/ui/mobile/danh_sach/widget/bieu_do_cong_viec.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/ui/mobile/danh_sach/widget/cell_cong_viec.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/widget/bieu_do_nhiem_vu_mobile.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/widget/nhiem_vu_item_mobile.dart';
import 'package:ccvc_mobile/nhiem_vu_module/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/calendar/table_calendar/table_calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NhiemVuCaNhanMobile extends StatefulWidget {
  final NhiemVuCubit cubit;
  final bool isCheck;

  const NhiemVuCaNhanMobile({
    Key? key,
    required this.cubit,
    required this.isCheck,
  }) : super(key: key);

  @override
  _NhiemVuCaNhanMobileState createState() => _NhiemVuCaNhanMobileState();
}

class _NhiemVuCaNhanMobileState extends State<NhiemVuCaNhanMobile> {
  DanhSachCubit danhSachCubit = DanhSachCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    danhSachCubit.callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              Container(
                padding: const EdgeInsets.only(
                  right: 16.0,
                  left: 16.0,
                  bottom: 20.0,
                ),
                child: BieuDoNhiemVuMobile(
                  title: S.current.nhiem_vu,
                  chartData: widget.cubit.chartDataNhiemVu,
                  cubit: danhSachCubit,
                ),
              ),
              Container(
                height: 6,
                color: homeColor,
              ),
              Container(
                padding: const EdgeInsets.only(
                  right: 16.0,
                  left: 16.0,
                  bottom: 20.0,
                ),
                child: BieuDoCongViecMobile(
                  title: S.current.cong_viec,
                  chartData: widget.cubit.chartDataNhiemVu,
                  cubit: danhSachCubit,
                ),
              ),
              Container(
                height: 6,
                color: homeColor,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.current.danh_sach_nhiem_vu,
                          style: textNormalCustom(
                            fontSize: 16,
                            color: textDropDownColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const DanhSachNhiemVuMobile(),
                              ),
                            );
                          },
                          icon: SvgPicture.asset(ImageAssets.ic_next_color),
                        )
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Container(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: StreamBuilder<List<PageData>>(
                        stream: danhSachCubit.dataSubject,
                        builder: (context, snapshot) {
                          final data = snapshot.data ?? [];
                          if (data.isNotEmpty) {
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.length < 3 ? data.length : 3,
                              itemBuilder: (context, index) {
                                return NhiemVuItemMobile(data: data[index]);
                              },
                            );
                          }
                          return SizedBox(
                            child: Text(
                              S.current.khong_co_du_lieu,
                              style: titleAppbar(fontSize: 16.0),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 6,
                color: homeColor,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.current.danh_sach_cong_viec,
                          style: textNormalCustom(
                            fontSize: 16,
                            color: textDropDownColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const DanhSachCongViecMobile(),
                              ),
                            );
                          },
                          icon: SvgPicture.asset(ImageAssets.ic_next_color),
                        )
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Container(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: StreamBuilder<List<PageDatas>>(
                        stream: danhSachCubit.dataSubjects,
                        builder: (context, snapshot) {
                          final data = snapshot.data ?? [];
                          if (data.isNotEmpty) {
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.length < 3 ? data.length : 3,
                              itemBuilder: (context, index) {
                                return CellCongViec(data: data[index]);
                              },
                            );
                          }
                          return SizedBox(
                            child: Text(
                              S.current.khong_co_du_lieu,
                              style: titleAppbar(fontSize: 16.0),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        TableCalendarWidget(
          onChange:
              (DateTime startDate, DateTime endDate, DateTime selectDay) {},
          onChangeRange:
              (DateTime? start, DateTime? end, DateTime? focusedDay) {},
        ),
      ],
    );
  }
}
