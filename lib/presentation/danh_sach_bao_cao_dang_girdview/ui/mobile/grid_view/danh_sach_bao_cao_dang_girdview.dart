import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/appbar/mobile/base_app_bar_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DanhSachBaoCaoDangGirdviewMobile extends StatefulWidget {
  const DanhSachBaoCaoDangGirdviewMobile({Key? key}) : super(key: key);

  @override
  _DanhSachBaoCaoDangGirdviewMobileState createState() =>
      _DanhSachBaoCaoDangGirdviewMobileState();
}

class _DanhSachBaoCaoDangGirdviewMobileState
    extends State<DanhSachBaoCaoDangGirdviewMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBarMobile(
        title: S.current.bac_cao,
        actions: [
          Container(
            padding: const EdgeInsets.only(top: 16, right: 16, bottom: 16),
            child: SvgPicture.asset(ImageAssets.icGridView),
          )
        ],
      ),
      body: GridView.builder(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 17,
          crossAxisSpacing: 17,
          childAspectRatio: 1.5,
          mainAxisExtent: 130,
        ),
        itemCount: 16,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: backgroundColorApp,
              border: Border.all(color: borderColor.withOpacity(0.5)),
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
                  padding: const EdgeInsets.only(top: 24, bottom: 16),
                  child: Image.asset(ImageAssets.icGroundMobile),
                ),
                Text(
                  S.current.bac_cao,
                  style: textNormal(textTitle, 16),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
