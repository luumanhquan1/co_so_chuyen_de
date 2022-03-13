import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/topic_hdsd.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ItemHuongDanSuDung extends StatelessWidget {
 final String url;
  final String title;

  const ItemHuongDanSuDung({
    Key? key,
    required this.title,
    required this.url,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        decoration: BoxDecoration(
          color: backgroundColorApp,
          border: Border.all(color: borderColor.withOpacity(0.5)),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: shadowContainerColor.withOpacity(0.05),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              url,
              width: 25.sp.textScale(),
              height: 25.sp.textScale(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Text(
                title,
                style: textNormalCustom(fontSize: 16.0.textScale(), color: titleColor),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
