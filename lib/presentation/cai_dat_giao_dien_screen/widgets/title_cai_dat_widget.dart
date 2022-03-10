import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:flutter/material.dart';

class TitleCaiDatWidget extends StatelessWidget {
  final String title;
  final Widget child;
  const TitleCaiDatWidget({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: textNormalCustom(fontSize: 16, color: titleColor),
        ),
        const SizedBox(
          height: 20,
        ),
        child
      ],
    );
  }
}
