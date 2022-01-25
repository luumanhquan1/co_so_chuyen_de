import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextFormWidget extends StatelessWidget {
  final String image;
  final String hint;

  const TextFormWidget({Key? key, required this.image, required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(image),
        const SizedBox(
          width: 14,
        ),
        Expanded(
          child: Form(
            child: TextFormField(
              decoration: InputDecoration(
                hintStyle: textNormalCustom(
                  color: unselectLabelColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                hintText: hint,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: lineColor),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: lineColor),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
