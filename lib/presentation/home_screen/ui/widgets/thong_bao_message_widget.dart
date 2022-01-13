import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThongBaoWidget extends StatelessWidget {
  final int sum;
  const ThongBaoWidget({Key? key, this.sum = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: SvgPicture.asset(
              ImageAssets.icThongBao,
              height: 26,
              width: 26,
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: statusCalenderRed,
              ),
              child: Text(
                sumThongBao(),
                style: textNormalCustom(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String sumThongBao() {
    if (sum > 10) {
      return '9+';
    }
    return sum.toString();
  }
}
