import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/images.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class WidgetImageMobile extends StatefulWidget {
  const WidgetImageMobile({Key? key}) : super(key: key);

  @override
  _WidgetImageMobileState createState() => _WidgetImageMobileState();
}

class _WidgetImageMobileState extends State<WidgetImageMobile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              Image.asset(
                '$baseImg/profile_edit_persion.png',
              ),
              spaceH12,
              Text(
                S.current.anh_dai_dien,
                style: tokenDetailAmount(
                  fontSize: 12.0.textScale(),
                  color: infoColor,
                ),
              ),
            ],
          ),
        ),
        spaceW16,
        Expanded(
          child: Column(
            children: [
              Image.asset(
                '$baseImg/profile_edit_persion.png',
              ),
              spaceH12,
              Text(
                S.current.anh_chu_ky,
                style: tokenDetailAmount(
                  fontSize: 12.0.textScale(),
                  color: infoColor,
                ),
              ),
            ],
          ),
        ),
        spaceW16,
        Expanded(
          child: Column(
            children: [
              Image.asset(
                '$baseImg/profile_edit_persion.png',
              ),
              spaceH12,
              Text(
                S.current.anh_ky_nhay,
                style: tokenDetailAmount(
                  fontSize: 12.0.textScale(),
                  color: infoColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
