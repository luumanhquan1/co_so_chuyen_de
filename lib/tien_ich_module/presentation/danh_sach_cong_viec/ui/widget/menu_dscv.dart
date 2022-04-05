import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/menu/widget/container_menu_bao_chi.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_sach_cong_viec/bloc/danh_sach_cong_viec_tien_ich_cubit.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_sach_cong_viec/ui/widget/cell_menu_custom.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_sach_cong_viec/ui/widget/container_menu_dscv.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_sach_cong_viec/ui/widget/theo_dang_lich_widget_dscv.dart';
import 'package:ccvc_mobile/tien_ich_module/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/screen_device_extension.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:ccvc_mobile/widgets/appbar/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'item_menu.dart';

class MenuDSCV extends StatefulWidget {
  final DanhSachCongViecTienIchCubit cubit;
  final Function theoDangLich;
  final Function TheoDangDanhSach;

  const MenuDSCV({
    Key? key,
    required this.theoDangLich,
    required this.TheoDangDanhSach,
    required this.cubit,
  }) : super(key: key);

  @override
  State<MenuDSCV> createState() => _MenuDSCVState();
}

class _MenuDSCVState extends State<MenuDSCV> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return screenDevice(
      mobileScreen: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 58,
            ),
            headerWidget(menu: S.current.danh_sach_cong_viec),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  StreamBuilder<List<bool>>(
                    stream: widget.cubit.selectTypeCalendarSubject.stream,
                    builder: (context, snapshot) {
                      return Column(
                        children: [
                          TheoDangLichWidgetDSCV(
                            icon: ImageAssets.icCVCuaBan,
                            name: S.current.cong_viec_cua_ban,
                            onTap: () {
                              widget.cubit.selectTypeCalendarSubject
                                  .add([true, false, false, false, false]);
                              widget.theoDangLich();
                              Navigator.pop(context);
                            },
                            isSelect: snapshot.data?[0] ?? true,
                            number: 0,
                          ),
                          TheoDangLichWidgetDSCV(
                            icon: ImageAssets.icCVQT,
                            name: S.current.cong_viec_quan_trong,
                            onTap: () {
                              widget.cubit.selectTypeCalendarSubject
                                  .add([false, true, false, false, false]);
                              widget.TheoDangDanhSach();
                              Navigator.pop(context);
                            },
                            isSelect: snapshot.data?[1] ?? true,
                            number: 0,
                          ),
                          TheoDangLichWidgetDSCV(
                            icon: ImageAssets.icHT,
                            name: S.current.da_hoan_thanh,
                            onTap: () {
                              widget.cubit.selectTypeCalendarSubject
                                  .add([false, false, true, false, false]);
                              widget.theoDangLich();
                              Navigator.pop(context);
                            },
                            isSelect: snapshot.data?[2] ?? true,
                            number: 0,
                          ),
                          TheoDangLichWidgetDSCV(
                            icon: ImageAssets.icGanChoToi,
                            name: S.current.gan_cho_toi,
                            onTap: () {
                              widget.cubit.selectTypeCalendarSubject
                                  .add([false, false, false, true, false]);
                              widget.TheoDangDanhSach();
                              Navigator.pop(context);
                            },
                            isSelect: snapshot.data?[3] ?? true,
                            number: 0,
                          ),
                          TheoDangLichWidgetDSCV(
                            icon: ImageAssets.icXoa,
                            name: S.current.da_bi_xoa,
                            onTap: () {
                              widget.cubit.selectTypeCalendarSubject
                                  .add([false, false, false, false, true]);
                              widget.theoDangLich();
                              Navigator.pop(context);
                            },
                            isSelect: snapshot.data?[4] ?? true,
                            number: 0,
                          ),
                        ],
                      );
                    },
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: listMenuDSCV
                            .map(
                              (e) => ContainerMenuDSCVWidget(
                                name: e.typeMenu.getTitle(),
                                icon: e.icon,
                                type: TypeContainer.expand,
                                childExpand: StreamBuilder<List<String>>(
                                  stream: widget.cubit.nhomCVMoiSubject.stream,
                                  builder: (context, snapshot) {
                                    final data = snapshot.data ?? [];
                                    if (data.isNotEmpty) {
                                      return ListView.builder(
                                        itemCount: data.length,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          final vl = data[index];
                                          return GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  top: 20),
                                              child: Text(
                                                vl,
                                                style: textNormalCustom(
                                                  color: titleItemEdit,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.0.textScale(),
                                                ),
                                                maxLines: 2,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                    return const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 30),
                                      child: SizedBox(),
                                    );
                                  },
                                ),
                                onTap: () {
                                  e.onTap(context, widget.cubit);
                                },
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      tabletScreen: Scaffold(
        backgroundColor: bgTabletColor,
        appBar: BaseAppBar(
          backGroundColor: bgTabletColor,
          title: S.current.danh_sach_cong_viec,
          leadingIcon: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              ImageAssets.icClose,
            ),
          ),
        ),
        body: StreamBuilder<List<bool>>(
          stream: widget.cubit.selectTypeCalendarSubject.stream,
          builder: (context, snapshot) {
            return Column(
              children: [
                CellMenuCustom(
                  icon: ImageAssets.ic01,
                  name: S.current.cong_viec_cua_ban,
                  onTap: () {
                    widget.cubit.selectTypeCalendarSubject
                        .add([true, false, false, false, false]);
                    widget.theoDangLich();
                    Navigator.pop(context);
                  },
                  isSelect: snapshot.data?[0] ?? true,
                ),
                CellMenuCustom(
                  icon: ImageAssets.ic02,
                  name: S.current.cong_viec_quan_trong,
                  onTap: () {
                    widget.cubit.selectTypeCalendarSubject
                        .add([false, true, false, false, false]);
                    widget.TheoDangDanhSach();
                    Navigator.pop(context);
                  },
                  isSelect: snapshot.data?[1] ?? true,
                ),
                CellMenuCustom(
                  icon: ImageAssets.ic03,
                  name: S.current.da_hoan_thanh,
                  onTap: () {
                    widget.cubit.selectTypeCalendarSubject
                        .add([false, false, true, false, false]);
                    widget.theoDangLich();
                    Navigator.pop(context);
                  },
                  isSelect: snapshot.data?[2] ?? true,
                ),
                CellMenuCustom(
                  icon: ImageAssets.ic04,
                  name: S.current.gan_cho_toi,
                  onTap: () {
                    widget.cubit.selectTypeCalendarSubject
                        .add([false, false, false, true, false]);
                    widget.TheoDangDanhSach();
                    Navigator.pop(context);
                  },
                  isSelect: snapshot.data?[3] ?? true,
                ),
                CellMenuCustom(
                  icon: ImageAssets.ic05,
                  name: S.current.da_bi_xoa,
                  onTap: () {
                    widget.cubit.selectTypeCalendarSubject
                        .add([false, false, false, false, true]);
                    widget.theoDangLich();
                    Navigator.pop(context);
                  },
                  isSelect: snapshot.data?[4] ?? true,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: listMenuDSCV
                            .map(
                              (e) => ContainerMenuDSCVWidget(
                                name: e.typeMenu.getTitle(),
                                icon: ImageAssets.ic06,
                                type: TypeContainer.expand,
                                childExpand: Column(
                                  children: e.typeMenu == TypeMenuDSCV.NhomCVMoi
                                      ? listNhomCVMoi
                                          .map(
                                            (e) => ContainerMenuDSCVWidget(
                                              icon: e.icon,
                                              name: e.typeMenu.getTitle(),
                                              isIcon: false,
                                              onTap: () {
                                                e.onTap(context, widget.cubit);
                                              },
                                            ),
                                          )
                                          .toList()
                                      : [],
                                ),
                                onTap: () {
                                  e.onTap(context, widget.cubit);
                                },
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget headerWidget({required String menu}) {
    return Row(
      children: [
        const SizedBox(
          width: 12,
        ),
        SvgPicture.asset(ImageAssets.icDocument),
        const SizedBox(
          width: 12,
        ),
        Text(
          menu,
          style: textNormalCustom(
            color: titleColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
