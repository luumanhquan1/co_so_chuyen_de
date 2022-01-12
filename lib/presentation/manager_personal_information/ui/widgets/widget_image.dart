import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/images.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
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
              '$baseImg/profile_edit_persion.png',
            ),
            spaceH24,
            Text(
              'Ảnh đại điện',
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
              '$baseImg/profile_edit_persion.png',
            ),
            spaceH24,
            Text(
              'Ảnh chữ ký',
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
              '$baseImg/profile_edit_persion.png',
            ),
            spaceH24,
            Text(
              'Ảnh ký nháy',
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
