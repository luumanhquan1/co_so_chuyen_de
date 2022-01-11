import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:flutter/material.dart';

class ButtonCustomBottomTablet extends StatefulWidget {
  final bool isColorBlue;
  final String title;
  final Function onPressed;

  const ButtonCustomBottomTablet(
      {Key? key,
      required this.isColorBlue,
      required this.title,
      required this.onPressed})
      : super(key: key);

  @override
  _ButtonCustomBottomTabletState createState() =>
      _ButtonCustomBottomTabletState();
}

class _ButtonCustomBottomTabletState extends State<ButtonCustomBottomTablet> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              widget.onPressed();
            },
            child: Container(
              height: 56.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: widget.isColorBlue ? textDefault : buttonColor2,
              ),
              child: Center(
                child: Text(
                  widget.title,
                  style: textNormalCustom(
                      fontSize: 18.0,
                      color: widget.isColorBlue
                          ? backgroundColorApp
                          : textDefault),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
