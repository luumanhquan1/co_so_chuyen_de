import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:flutter/material.dart';

class DoubleButtonBottomTablet extends StatefulWidget {
  final String title1;
  final String title2;

  final Function onPressed1;
  final Function onPressed2;

  const DoubleButtonBottomTablet(
      {Key? key,
        required this.title1,
        required this.title2,
        required this.onPressed1,
        required this.onPressed2})
      : super(key: key);

  @override
  State<DoubleButtonBottomTablet> createState() => _DoubleButtonBottomTabletState();
}

class _DoubleButtonBottomTabletState extends State<DoubleButtonBottomTablet> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              widget.onPressed1();
            },
            child: Container(
              height: 56.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: buttonColor2,
              ),
              child: Center(
                child: Text(
                  widget.title1,
                  style: textNormalCustom(
                    color: textDefault,
                    fontSize: 18.0
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: GestureDetector(
            onTap: () {
              widget.onPressed2();
            },
            child: Container(
              height: 56.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: textDefault,
              ),
              child: Center(
                child: Text(
                  widget.title2,
                  style: textNormalCustom(
                    color: backgroundColorApp,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
