import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleWidget extends StatefulWidget {
  final String image;
  final String title;
  final String? title2;
  final bool isExpand;
  final Icon icon;
  final Function onTap;

  const TitleWidget({
    Key? key,
    required this.image,
    required this.title,
    this.title2,
    required this.isExpand,
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
              SvgPicture.asset(widget.image),
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
              if (widget.isExpand)
                IconButton(
                  onPressed: () {
                    widget.onTap();
                  },
                  icon: widget.icon,
                )
              else
                Container()
            ],
          ),
        )
      ],
    );
  }
}
