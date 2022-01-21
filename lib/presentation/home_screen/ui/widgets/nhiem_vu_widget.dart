import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(urlIcon),
          const SizedBox(
            height: 12,
          ),
          Text(
            title,
            style: textNormal(textTitle, 12.0.textScale(space: 4)),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            '12,109',
            style: titleText(color: numberOfCalenders, fontSize: 22),
          )
        ],
      ),
    );
  }
}
