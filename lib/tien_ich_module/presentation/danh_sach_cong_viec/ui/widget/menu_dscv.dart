import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/calender_work/ui/widget/container_menu_widget.dart';
import 'package:ccvc_mobile/presentation/calender_work/ui/widget/dang_lich_widget.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_sach_cong_viec/bloc/danh_sach_cong_viec_tien_ich_cubit.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/screen_device_extension.dart';
import 'package:ccvc_mobile/widgets/appbar/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ccvc_mobile/presentation/calender_work/ui/widget/container_menu_widget_tablet.dart';

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
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: TheoDangLichWidget(
                              icon: ImageAssets.ic_CVcuaBan,
                              name: S.current.cong_viec_cua_ban,
                              onTap: () {
                                widget.cubit.selectTypeCalendarSubject
                                    .add([true, false, false, false, false]);
                                widget.theoDangLich();
                                Navigator.pop(context);
                              },
                              isSelect: snapshot.data?[0] ?? true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: TheoDangLichWidget(
                              icon: ImageAssets.ic_cvQT,
                              name: S.current.cong_viec_quan_trong,
                              onTap: () {
                                widget.cubit.selectTypeCalendarSubject
                                    .add([false, true, false, false, false]);
                                widget.TheoDangDanhSach();
                                Navigator.pop(context);
                              },
                              isSelect: snapshot.data?[1] ?? true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: TheoDangLichWidget(
                              icon: ImageAssets.ic_cvFInish,
                              name: S.current.da_hoan_thanh,
                              onTap: () {
                                widget.cubit.selectTypeCalendarSubject
                                    .add([false, false, true, false, false]);
                                widget.theoDangLich();
                                Navigator.pop(context);
                              },
                              isSelect: snapshot.data?[2] ?? true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: TheoDangLichWidget(
                              icon: ImageAssets.ic_ganCHo_toi,
                              name: S.current.gan_cho_toi,
                              onTap: () {
                                widget.cubit.selectTypeCalendarSubject
                                    .add([false, false, false, true, false]);
                                widget.TheoDangDanhSach();
                                Navigator.pop(context);
                              },
                              isSelect: snapshot.data?[3] ?? true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: TheoDangLichWidget(
                              icon: ImageAssets.ic_CV_xoa,
                              name: S.current.da_bi_xoa,
                              onTap: () {
                                widget.cubit.selectTypeCalendarSubject
                                    .add([false, false, false, false, true]);
                                widget.theoDangLich();
                                Navigator.pop(context);
                              },
                              isSelect: snapshot.data?[4] ?? true,
                            ),
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
                              (e) => ContainerMenuWidget(
                                name: e.typeMenu.getTitle(),
                                icon: e.icon,
                                // type: e.type,
                                index: e.index ?? 0,
                                childExpand: Column(
                                  children: (e.typeMenu ==
                                          TypeMenuDSCV.NhomCVMoi)
                                      ? listNhomCVMoi
                                          .map(
                                            (e) => ContainerMenuWidget(
                                              icon: e.icon,
                                              name: e.typeMenu.getTitle(),
                                              index: e.index ?? 0,
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      tabletScreen: Scaffold(
        appBar: BaseAppBar(
          title: S.current.danh_sach_cong_viec,
          leadingIcon: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SizedBox(
              height: 10,
              width: 10,
              child: Container(
                padding: const EdgeInsets.all(15),
                child: SvgPicture.asset(
                  ImageAssets.icExit,
                ),
              ),
            ),
          ),
        ),
        body: StreamBuilder<List<bool>>(
          stream: widget.cubit.selectTypeCalendarSubject.stream,
          builder: (context, snapshot) {
            return Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TheoDangLichWidget(
                    icon: ImageAssets.ic_CVcuaBan,
                    name: S.current.cong_viec_cua_ban,
                    onTap: () {
                      widget.cubit.selectTypeCalendarSubject
                          .add([true, false, false, false, false]);
                      widget.theoDangLich();
                      Navigator.pop(context);
                    },
                    isSelect: snapshot.data?[0] ?? true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TheoDangLichWidget(
                    icon: ImageAssets.ic_cvQT,
                    name: S.current.cong_viec_quan_trong,
                    onTap: () {
                      widget.cubit.selectTypeCalendarSubject
                          .add([false, true, false, false, false]);
                      widget.TheoDangDanhSach();
                      Navigator.pop(context);
                    },
                    isSelect: snapshot.data?[1] ?? true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TheoDangLichWidget(
                    icon: ImageAssets.ic_cvFInish,
                    name: S.current.da_hoan_thanh,
                    onTap: () {
                      widget.cubit.selectTypeCalendarSubject
                          .add([false, false, true, false, false]);
                      widget.theoDangLich();
                      Navigator.pop(context);
                    },
                    isSelect: snapshot.data?[2] ?? true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TheoDangLichWidget(
                    icon: ImageAssets.ic_ganCHo_toi,
                    name: S.current.gan_cho_toi,
                    onTap: () {
                      widget.cubit.selectTypeCalendarSubject
                          .add([false, false, false, true, false]);
                      widget.TheoDangDanhSach();
                      Navigator.pop(context);
                    },
                    isSelect: snapshot.data?[3] ?? true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TheoDangLichWidget(
                    icon: ImageAssets.ic_CV_xoa,
                    name: S.current.da_bi_xoa,
                    onTap: () {
                      widget.cubit.selectTypeCalendarSubject
                          .add([false, false, false, false, true]);
                      widget.theoDangLich();
                      Navigator.pop(context);
                    },
                    isSelect: snapshot.data?[4] ?? true,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: listMenuDSCV
                            .map(
                              (e) => ContainerMenuWidgetTablet(
                                name: e.typeMenu.getTitle(),
                                icon: e.icon,
                                index: e.index ?? 0,
                                childExpand: Column(
                                  children: e.typeMenu == TypeMenuDSCV.NhomCVMoi
                                      ? listNhomCVMoi
                                          .map(
                                            (e) => ContainerMenuWidgetTablet(
                                              icon: e.icon,
                                              name: e.typeMenu.getTitle(),
                                              index: e.index ?? 0,
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
        SvgPicture.asset(ImageAssets.ic_documentDSCV),
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
