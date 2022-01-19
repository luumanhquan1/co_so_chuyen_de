import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class DoubleButtonEditHDSDScreen extends StatefulWidget {
  final String title1;
  final String title2;

  final Function onPressed1;
  final Function onPressed2;

  const DoubleButtonEditHDSDScreen({
    Key? key,
    required this.title1,
    required this.title2,
    required this.onPressed1,
    required this.onPressed2,
  }) : super(key: key);

  @override
  State<DoubleButtonEditHDSDScreen> createState() =>
      _DoubleButtonEditHDSDScreenState();
}

class _DoubleButtonEditHDSDScreenState
    extends State<DoubleButtonEditHDSDScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            widget.onPressed1();
          },
          child: Container(
            padding: const EdgeInsets.only(
              left: 33,
              right: 33,
              top: 13,
              bottom: 13,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0.textScale(space: 4.0)),
              color: buttonColor2,
            ),
            child: Center(
              child: Text(
                widget.title1,
                style: textNormalCustom(
                  fontSize: 14.0.textScale(space: 4.0),
                  color: textDefault,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 16.0.textScale(space: 8.0)),
        GestureDetector(
          onTap: () {
            widget.onPressed2();
          },
          child: Container(
            padding:
                const EdgeInsets.only(left: 33, right: 33, top: 13, bottom: 13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0.textScale(space: 4.0)),
              color: textDefault,
            ),
            child: Center(
              child: Text(
                widget.title2,
                style: textNormalCustom(
                  fontSize: 14.0.textScale(space: 4.0),
                  color: backgroundColorApp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
