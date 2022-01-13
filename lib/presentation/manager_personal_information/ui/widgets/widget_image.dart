import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class WigetImage extends StatefulWidget {
  const WigetImage({Key? key}) : super(key: key);

  @override
  _WigetImageState createState() => _WigetImageState();
}

class _WigetImageState extends State<WigetImage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Image.asset(
              ImageAssets.icProfile,
            ),
            spaceH24,
            Text(
              S.current.anh_dai_dien,
              style: tokenDetailAmount(
                fontSize: 14.0.textScale(),
                color: infoColor,
              ),
            ),
          ],
        ),
        spaceW56,
        Column(
          children: [
            Image.asset(
              ImageAssets.icProfile,
            ),
            spaceH24,
            Text(
              S.current.anh_chu_ky,
              style: tokenDetailAmount(
                fontSize: 14.0.textScale(),
                color: infoColor,
              ),
            ),
          ],
        ),
        spaceW56,
        Column(
          children: [
            Image.asset(
              ImageAssets.icProfile,
            ),
            spaceH24,
            Text(
              S.current.anh_ky_nhay,
              style: tokenDetailAmount(
                fontSize: 14.0.textScale(),
                color: infoColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
