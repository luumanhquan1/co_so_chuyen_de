import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tabbar/bloc/bao_chi_mang_xa_hoi_cubit.dart';
import 'package:ccvc_mobile/presentation/calender_work/ui/widget/container_menu_widget.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BaoChiMangXaHoiMenu extends StatefulWidget {
  final BaoChiMangXaHoiBloc cubit;

  const BaoChiMangXaHoiMenu({Key? key, required this.cubit}) : super(key: key);

  @override
  _BaoChiMangXaHoiMenuState createState() => _BaoChiMangXaHoiMenuState();
}

class _BaoChiMangXaHoiMenuState extends State<BaoChiMangXaHoiMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 58,
          ),
          headerWidget(menu: S.current.baochi_mangxahoi),
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
                  itemCount: widget.cubit.listTitleItemMenu.length,
                  itemBuilder: (context, index) {
                    return ContainerMenuWidget(
                      name: widget.cubit.listTitleItemMenu[index],
                      icon: ImageAssets.icMenuItemBCMXH,
                      type: TypeContainer.expand,
                      childExpand: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.cubit.listSubMenu[index].length,
                        itemBuilder: (context, indexItem) {
                          return Container(
                            padding: const EdgeInsets.fromLTRB(32, 0, 0, 16),
                            child: Text(
                              widget.cubit.listSubMenu[index][indexItem].title,
                              style: textNormalCustom(
                              color: textTitle,
                              fontSize: 16.0.textScale(),
                              fontWeight: FontWeight.w400,
                            ),
                            ),
                          );
                        },
                      ),
                      onTap: () {},
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
        const SizedBox(
          width: 12,
        ),
        SvgPicture.asset(ImageAssets.icHeaderMenuBCMXH),
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
