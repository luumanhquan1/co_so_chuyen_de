import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:flutter/material.dart';

class NhiemVuWidget extends StatelessWidget {
  final String urlIcon;
  final String title;
  final String value;
  const NhiemVuWidget({
    Key? key,
    required this.value,
    required this.title,
    required this.urlIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: backgroundRowColor,
      ),
      child: Column(
        children: [
          Container(
            height: 56,
            width: 56,
            color: Colors.red,
          ),
          Text(
            title,
            style: textNormal(textTitle, 12),
          )
        ],
      ),
    );
  }
}
