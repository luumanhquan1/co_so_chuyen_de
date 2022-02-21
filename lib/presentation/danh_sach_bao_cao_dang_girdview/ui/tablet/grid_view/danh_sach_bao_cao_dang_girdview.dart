import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_with_two_leading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DanhSachBaoCaoDangGirdviewTablet extends StatefulWidget {
  const DanhSachBaoCaoDangGirdviewTablet({Key? key}) : super(key: key);

  @override
  _DanhSachBaoCaoDangGirdviewTabletState createState() =>
      _DanhSachBaoCaoDangGirdviewTabletState();
}

class _DanhSachBaoCaoDangGirdviewTabletState
    extends State<DanhSachBaoCaoDangGirdviewTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWidgets,
      appBar: AppBarWithTwoLeading(
        backGroundColorTablet: bgWidgets,
        title: S.current.bac_cao,
        actions: [
          Container(
            padding: const EdgeInsets.only(top: 16, right: 30, bottom: 16),
            child: SvgPicture.asset(ImageAssets.icGridTablet),
          )
        ],
      ),
      body: GridView.builder(
        cacheExtent: 100,
        semanticChildCount: 100,
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 28, bottom: 28),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.5,
          mainAxisExtent: 138,
        ),
        itemCount: 16,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: backgroundColorApp,
              border: Border.all(color: borderItemCalender.withOpacity(0.5)),
              boxShadow: [
                BoxShadow(
                  color: shadowContainerColor.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 14),
                  child: Image.asset(ImageAssets.icMenuGridTablet),
                ),
                Text(
                  S.current.bac_cao,
                  style: textNormalCustom(color: textTitle, fontSize: 18),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
