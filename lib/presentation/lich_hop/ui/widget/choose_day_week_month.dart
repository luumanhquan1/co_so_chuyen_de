import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChooseDayWeedMonth extends StatelessWidget {
  const ChooseDayWeedMonth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(ImageAssets.icDayMonth),
                  Text(
                    S.current.ngay,
                    style: textNormal(linkColor, 14.0),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(ImageAssets.icDayCalenderWeek),
                  Text(
                    S.current.tuan,
                    style: textNormal(linkColor, 14.0),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(ImageAssets.icDayCalenderMonth),
                  Text(
                    S.current.thang,
                    style: textNormal(linkColor, 14.0),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
