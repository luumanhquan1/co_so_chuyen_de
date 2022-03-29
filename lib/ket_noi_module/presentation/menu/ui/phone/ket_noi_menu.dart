import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/loai_bai_viet_model.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/menu/ui/widget/container_ket_noi_menu.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/tao_su_kien/bloc/tao_su_kien_cubit.dart';
import 'package:ccvc_mobile/ket_noi_module/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KetNoiMenu extends StatefulWidget {
  final TaoSuKienCubit taoSuKienCubit;
  final Function(LoaiBaiVietModel) onChange;
  final Function(String) onSelect;
  final Function(String) ontChangeTitle;

  const KetNoiMenu({
    Key? key,
    required this.taoSuKienCubit,
    required this.onChange,
    required this.onSelect,
    required this.ontChangeTitle,
  }) : super(key: key);

  @override
  State<KetNoiMenu> createState() => _KetNoiMenuState();
}

class _KetNoiMenuState extends State<KetNoiMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 58,
          ),
          headerWidget(menu: S.current.ket_noi),
          const SizedBox(
            height: 24,
          ),
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
                    return ContainerKetNoiMenuWidget(
                      name: widget.taoSuKienCubit.listData[index].title ?? '',
                      icon: ImageAssets.ic_wifi,
                      lenghtItem: widget.taoSuKienCubit.listData.length,
                      childExpand: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.taoSuKienCubit.listData[index]
                                .childrens?.length ??
                            0,
                        itemBuilder: (context, index2) {
                          return ContainerKetNoiMenuWidget(
                            name: widget.taoSuKienCubit.listData[index]
                                    .childrens?[index2].title ??
                                '',
                            lenghtItem: widget.taoSuKienCubit.listData[index]
                                    .childrens?[index2].childrens?.length ??
                                0,
                            childExpand: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: widget.taoSuKienCubit.listData[index]
                                      .childrens?[index2].childrens?.length ??
                                  0,
                              itemBuilder: (context, index3) {
                                return ContainerKetNoiMenuWidget(
                                  name: widget
                                          .taoSuKienCubit
                                          .listData[index]
                                          .childrens?[index2]
                                          .childrens?[index3]
                                          .title ??
                                      '',
                                  lenghtItem: 0,
                                  onTap: () {
                                    widget.onChange(
                                      widget.taoSuKienCubit.listData[index],
                                    );
                                    widget.taoSuKienCubit.listData[index]
                                                .alias ==
                                            S.current.ket_nois
                                        ? widget.onSelect(
                                            widget
                                                    .taoSuKienCubit
                                                    .listData[index]
                                                    .childrens?[index2]
                                                    .childrens?[index3]
                                                    .code ??
                                                '',
                                          )
                                        : widget.onSelect(
                                            widget
                                                    .taoSuKienCubit
                                                    .listData[index]
                                                    .childrens?[index2]
                                                    .childrens?[index3]
                                                    .id ??
                                                '',
                                          );
                                    widget.ontChangeTitle(
                                      widget
                                              .taoSuKienCubit
                                              .listData[index]
                                              .childrens?[index2]
                                              .childrens?[index3]
                                              .title ??
                                          '',
                                    );
                                  },
                                );
                              },
                            ),
                            onTap: () {
                              widget.onChange(
                                widget.taoSuKienCubit.listData[index],
                              );
                              widget.taoSuKienCubit.listData[index].alias ==
                                      S.current.ket_nois
                                  ? widget.onSelect(
                                      widget.taoSuKienCubit.listData[index]
                                              .childrens?[index2].code ??
                                          '',
                                    )
                                  : widget.onSelect(
                                      widget.taoSuKienCubit.listData[index]
                                              .childrens?[index2].id ??
                                          '',
                                    );
                              widget.ontChangeTitle(
                                widget.taoSuKienCubit.listData[index]
                                        .childrens?[index2].title ??
                                    '',
                              );
                            },
                          );
                        },
                      ),
                      onTap: () {
                        widget.onChange(
                          widget.taoSuKienCubit.listData[index],
                        );
                        widget.ontChangeTitle(
                          widget.taoSuKienCubit.listData[index].title ?? '',
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
    );
  }

  Widget headerWidget({required String menu}) {
    return Row(
      children: [
        spaceW12,
        SvgPicture.asset(ImageAssets.ic_ket_noi),
        spaceW12,
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
