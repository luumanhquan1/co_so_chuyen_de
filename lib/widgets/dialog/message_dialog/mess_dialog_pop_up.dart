import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageDialogPopup extends StatelessWidget {
  const MessageDialogPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      decoration: const BoxDecoration(
          color: backgroundColorApp,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          SvgPicture.asset(
            ImageAssets.icImageLockReset,
            width: 56,
            height: 56,
          ),
          spaceH32,
          Text(
            'Cập nhật mật khẩu thành công',
            style: textNormalCustom(fontSize: 18, color: titleColor),
          )
        ],
      ),
    );
  }
}
