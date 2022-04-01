import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/ket_noi_module/config/resources/color.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/loai_bai_viet_model.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/menu/ui/widget/container_ket_noi_tablet_menu.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/tao_su_kien/bloc/tao_su_kien_cubit.dart';
import 'package:ccvc_mobile/ket_noi_module/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/appbar/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KetNoiMenuTablet extends StatefulWidget {
  final TaoSuKienCubit taoSuKienCubit;
  final Function(LoaiBaiVietModel) onChange;
  final Function(String) onSelect;
  final Function(String) ontChangeTitle;

  const KetNoiMenuTablet({
    Key? key,
    required this.taoSuKienCubit,
    required this.onChange,
    required this.onSelect,
    required this.ontChangeTitle,
  }) : super(key: key);

  @override
  _KetNoiMenuTabletState createState() => _KetNoiMenuTabletState();
}

class _KetNoiMenuTabletState extends State<KetNoiMenuTablet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTabletColor,
      appBar: BaseAppBar(
        title: S.current.menu,
        leadingIcon: IconButton(
          icon: SvgPicture.asset(
            ImageAssets.icX,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 28, right: 28, top: 12, bottom: 28),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.taoSuKienCubit.listData.length,
                    itemBuilder: (context, index) {
                      return ContainerKetNoiTablet(
                        name: widget.taoSuKienCubit.listData[index].title,
                        icon: ImageAssets.icSide,
                        lenghtItem: widget.taoSuKienCubit.listData.length,
                        childExpand: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.taoSuKienCubit.listData[index]
                                  .childrens.length,
                          itemBuilder: (context, index2) {
                            return ContainerKetNoiTablet(
                              name: widget.taoSuKienCubit.listData[index]
                                      .childrens[index2].title,
                              lenghtItem: widget.taoSuKienCubit.listData[index]
                                      .childrens[index2].childrens.length,
                              childExpand: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: widget.taoSuKienCubit.listData[index]
                                        .childrens[index2].childrens.length,
                                itemBuilder: (context, index3) {
                                  return ContainerKetNoiTablet(
                                    name: widget
                                            .taoSuKienCubit
                                            .listData[index]
                                            .childrens[index2]
                                            .childrens[index3]
                                            .title,
                                    lenghtItem: 0,
                                    onTap: () {
                                      // widget.onChange(
                                      //   widget.taoSuKienCubit.listData[index],
                                      // );
                                      // widget.taoSuKienCubit.listData[index]
                                      //             .alias ==
                                      //         S.current.ket_nois
                                      //     ? widget.onSelect(
                                      //         widget
                                      //                 .taoSuKienCubit
                                      //                 .listData[index]
                                      //                 .childrens?[index2]
                                      //                 .childrens?[index3]
                                      //                 .code ??
                                      //             '',
                                      //       )
                                      //     : widget.onSelect(
                                      //         widget
                                      //                 .taoSuKienCubit
                                      //                 .listData[index]
                                      //                 .childrens?[index2]
                                      //                 .childrens?[index3]
                                      //                 .id ??
                                      //             '',
                                      //       );
                                      // widget.ontChangeTitle(
                                      //   widget
                                      //           .taoSuKienCubit
                                      //           .listData[index]
                                      //           .childrens?[index2]
                                      //           .childrens?[index3]
                                      //           .title ??
                                      //       '',
                                      // );
                                    },
                                  );
                                },
                              ),
                              onTap: () {
                                // widget.onChange(
                                //   widget.taoSuKienCubit.listData[index],
                                // );
                                // widget.taoSuKienCubit.listData[index].alias ==
                                //         S.current.ket_nois
                                //     ? widget.onSelect(
                                //         widget.taoSuKienCubit.listData[index]
                                //                 .childrens?[index2].code ??
                                //             '',
                                //       )
                                //     : widget.onSelect(
                                //         widget.taoSuKienCubit.listData[index]
                                //                 .childrens?[index2].id ??
                                //             '',
                                //       );
                                // widget.ontChangeTitle(
                                //   widget.taoSuKienCubit.listData[index]
                                //           .childrens?[index2].title ??
                                //       '',
                                // );
                              },
                            );
                          },
                        ),
                        onTap: () {
                          widget.onChange(
                            widget.taoSuKienCubit.listData[index],
                          );
                          widget.ontChangeTitle(
                            widget.taoSuKienCubit.listData[index].title,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
