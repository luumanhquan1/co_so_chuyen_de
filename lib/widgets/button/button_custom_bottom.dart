import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:flutter/material.dart';

class ButtonCustomBottom extends StatefulWidget {
  final bool isColorBlue;
  final String title;
  final Function onPressed;

  const ButtonCustomBottom(
      {Key? key,
      required this.isColorBlue,
      required this.title,
      required this.onPressed})
      : super(key: key);

  @override
  _ButtonCustomBottomState createState() => _ButtonCustomBottomState();
}

class _ButtonCustomBottomState extends State<ButtonCustomBottom> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: widget.isColorBlue ? textDefault : buttonColor2,
            ),
            child: GestureDetector(
              onTap: () {
                widget.onPressed();
              },
              child: Center(
                child: Text(
                  widget.title,
                  style: textNormalCustom(
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
