import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemInfomation extends StatelessWidget {
  final ItemInfomationModel infomationModel;

  const ItemInfomation({
    Key? key,
    required this.infomationModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          infomationModel.image,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              infomationModel.title,
              style: textNormalCustom(
                color: unselectLabelColor,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              infomationModel.index,
              style: textNormalCustom(
                color: infomationModel.color,
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        )
      ],
    );
  }
}

class ItemInfomationModel {
  final String image;
  final Color color;
  final String title;
  final String index;

  const ItemInfomationModel({
    required this.image,
    required this.color,
    required this.title,
    required this.index,
  });
}
