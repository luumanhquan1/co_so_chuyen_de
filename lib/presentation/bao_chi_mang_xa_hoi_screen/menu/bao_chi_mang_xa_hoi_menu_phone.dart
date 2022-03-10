import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tabbar/bloc/bao_chi_mang_xa_hoi_cubit.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tabbar/ui/widget/item_menu_bao_chi_mang_xa_hoi.dart';
import 'package:ccvc_mobile/presentation/calender_work/ui/widget/container_menu_widget.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
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
              child: Column(
                children: listBaoChiMangXaHoi
                    .map(
                      (e) => ContainerMenuWidget(
                        name: e.typeMenu.getTitle(),
                        icon: e.icon,
                        type: e.type,
                        childExpand: Column(
                          children: const [
                            SizedBox(
                              height: 100,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
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
