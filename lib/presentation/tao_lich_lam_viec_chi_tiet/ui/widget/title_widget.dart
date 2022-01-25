import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleWidget extends StatefulWidget {
  final String? image;
  final String title;
  final String? title2;
  final Icon icon;
  final bool isColor;
  final Function onTap;

  const TitleWidget({
    Key? key,
    this.image,
    required this.title,
    this.title2,
    required this.isColor,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  State<TitleWidget> createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              if (widget.isColor)
                Container(
                  height: 12.0.textScale(),
                  width: 12.0.textScale(),
                  decoration: BoxDecoration(
                    color: choTrinhKyColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                )
              else
                SizedBox(
                  height: 18.0.textScale(),
                  width: 18.0.textScale(),
                  child:
                      SvgPicture.asset(widget?.image ?? ImageAssets.icNhacLai),
                ),
              SizedBox(
                width: 14.5.textScale(),
              ),
              Text(
                widget.title,
                style: textNormalCustom(
                  color: dateColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title2 ?? '',
                style: textNormalCustom(
                  color: dateColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              IconButton(
                onPressed: () {
                  widget.onTap();
                },
                icon: widget.icon,
              )
            ],
          ),
        )
      ],
    );
  }
}
