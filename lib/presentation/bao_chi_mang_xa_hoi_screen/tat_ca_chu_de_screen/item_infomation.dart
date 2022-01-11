import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemInfomation extends StatelessWidget {
  final String image;
  final Color color;
  final String title;
  final String index;

  const ItemInfomation(
      {Key? key,
      required this.image,
      required this.color,
      required this.title,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          image,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          children: [
            Text(title,
                style: textNormalCustom(
                    color: unselectLabelColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14)),
            Text(
              index,
              style: textNormalCustom(
                  color: color, fontSize: 26, fontWeight: FontWeight.w700),
            )
          ],
        )
      ],
    );
  }
}
