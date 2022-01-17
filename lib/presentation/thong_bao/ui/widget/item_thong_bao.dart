import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';

class ItemThongBao extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  final String time;
  final bool status;

  const ItemThongBao({
    Key? key,
    required this.image,
    required this.title,
    required this.content,
    required this.time,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(image),
              Text(
                title,
                style: textNormalCustom(
                  color: titleColor,
                  fontSize: 16.0.textScale(),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.circle,
                size: 8,
                color: status ? Colors.white : textColorMangXaHoi,
              ),
            ],
          ),

          Text(
            title,
            style: textNormalCustom(
              color: titleColumn,
              fontSize: 14.0.textScale(),
              fontWeight: FontWeight.w400,
            ),
          ),

          Text(
            time,
            style: textNormalCustom(
              color: AqiColor,
              fontSize: 14.0.textScale(),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
