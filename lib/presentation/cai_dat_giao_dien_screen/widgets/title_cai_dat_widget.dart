import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/utils/extensions/screen_device_extension.dart';
import 'package:flutter/material.dart';

class TitleCaiDatWidget extends StatelessWidget {
  final String title;
  final Widget child;
  const TitleCaiDatWidget({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenDevice(
        mobileScreen: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
          ),
        ),
        tabletScreen: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Text(
                title,
                style: textNormalCustom(fontSize: 18, color: titleColor),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 48,
                  right: 48,
                  left: 48,
                  bottom: 50,
                ),
                decoration: BoxDecoration(
                  color: backgroundRowColor,
                  border: Border.all(color: borderColor.withOpacity(0.5)),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: child,
              )
            ],
          ),
        ));
  }
}