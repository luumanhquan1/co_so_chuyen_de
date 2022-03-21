import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  final String title;
  final Function(String) onchange;

  const CustomRadioButton({
    Key? key,
    required this.title,
    required this.onchange,
  }) : super(key: key);

  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  String groupValue = 'Nam';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.title,
          style: tokenDetailAmount(
            fontSize: 16,
            color: titleColor,
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text(
              S.current.Nam,
              style: tokenDetailAmount(
                fontSize: 14,
                color: titleColor,
              ),
            ),
            //bgDropDown
            leading: Radio(
              fillColor: MaterialStateProperty.resolveWith(getColor),
              activeColor: textDefault,
              value: S.current.Nam,
              onChanged: (String? value) {
                setState(() {});
                groupValue = value ?? S.current.Nam;
                widget.onchange(groupValue);
              },
              groupValue: groupValue,
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text(
              S.current.Nu,
              style: tokenDetailAmount(
                fontSize: 14,
                color: titleColor,
              ),
            ),
            leading: Radio(
              fillColor: MaterialStateProperty.resolveWith(getColor),
              activeColor: textDefault,
              value: S.current.Nu,
              onChanged: (String? value) {
                setState(() {});
                groupValue = value ?? S.current.Nu;
                widget.onchange(groupValue);
              },
              groupValue: groupValue,
            ),
          ),
        )
      ],
    );
  }

  Color getColor(Set<MaterialState> states) {
    return textDefault;
  }
}
