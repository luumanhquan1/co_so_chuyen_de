import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/ket_noi_item_model.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/danh_sach_chung/bloc/ket_noi_cubit.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/menu/ui/widget/container_ket_noi_menu.dart';
import 'package:ccvc_mobile/ket_noi_module/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KetNoiMenu extends StatefulWidget {
  final KetNoiCubit cubit;

  const KetNoiMenu({Key? key, required this.cubit}) : super(key: key);

  @override
  State<KetNoiMenu> createState() => _KetNoiMenuState();
}

class _KetNoiMenuState extends State<KetNoiMenu> {
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
            flex: 8,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: listKetNoi
                          .map(
                            (e) => ContainerKetNoiMenuWidget(
                              name: e.typeMenu.getTitle(),
                              icon: e.icon,
                              type: e.type,
                              index: e.index ?? 0,
                              childExpand: Column(
                                children: e.typeMenu == TypeKetNoiMenu.SuKien
                                    ? listSuKien
                                        .map(
                                          (e) => ContainerKetNoiMenuWidget(
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
                                    : listKetNoi2
                                        .map(
                                          (e) => ContainerKetNoiMenuWidget(
                                            icon: e.icon,
                                            name: e.typeMenu.getTitle(),
                                            index: e.index ?? 0,
                                            isIcon: false,
                                            onTap: () {
                                              e.onTap(context, widget.cubit);
                                            },
                                          ),
                                        )
                                        .toList(),
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
