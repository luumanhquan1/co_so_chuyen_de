import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCheckBoxTablet extends StatefulWidget {
  final title;
  bool isCheck;
  final Function(bool check) onChange;

  CustomCheckBoxTablet({
    Key? key,
    required this.title,
    required this.isCheck,
    required this.onChange,
  }) : super(key: key);

  @override
  _CustomCheckBoxTabletState createState() => _CustomCheckBoxTabletState();
}

class _CustomCheckBoxTabletState extends State<CustomCheckBoxTablet> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Checkbox(
            checkColor: Colors.white,
            // color of tick Mark
            activeColor: indicatorColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
            side: const BorderSide(width: 1.5, color: lineColor),
            value: widget.isCheck,
            onChanged: (value) {
              setState(() {
                widget.onChange(widget.isCheck);
              });
            },
          ),
        ),
        const SizedBox(
          width: 14,
        ),
        Text(
          widget.title,
          style: textNormal(titleColor, 14.0.textScale()),
        )
      ],
    );
  }
}
