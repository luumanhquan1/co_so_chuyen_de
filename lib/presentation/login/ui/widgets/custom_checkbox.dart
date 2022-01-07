import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final String title;
  bool isCheck;
  final Function(bool check) onChange;

  CustomCheckBox({
    Key? key,
    required this.title,
    required this.isCheck,
    required this.onChange,
  }) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          // color of tick Mark
          activeColor: const Color(0xff3D5586),
          side: MaterialStateBorderSide.resolveWith(
            (states) => const BorderSide(
              color: Color(0xffDBDFEF),
            ),
          ),
          value: widget.isCheck,
          onChanged: (value) {
            setState(() {
              widget.onChange(widget.isCheck);
            });
          },
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          widget.title,
          style: const TextStyle(fontSize: 14),
        )
      ],
    );
  }
}
