import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class RowDataWidget extends StatelessWidget {
  final String keyTxt;
  final String value;
  const RowDataWidget({Key? key, required this.keyTxt, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            keyTxt,
            style: textNormal(infoColor, 14.0.textScale()),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            value,
            style: textNormal(titleColor, 14.0.textScale()),
          ),
        )
      ],
    );
  }
}
