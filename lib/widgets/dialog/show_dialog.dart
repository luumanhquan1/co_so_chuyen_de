import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/widgets/button/button_custom_bottom.dart';
import 'package:flutter/material.dart';

Future<T?> showDiaLogMobile<T>(
  BuildContext context, {
  required String title,
  required String textContent,
  required Widget icon,
  required String btnRightTxt,
  required String btnLeftTxt,
  bool showTablet = false,
  bool isBottomShow = true,
  required Function funcBtnRight,
}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          width: showTablet
              ? double.maxFinite
              : MediaQuery.of(context).size.width / 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: titleAppbar(),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                textContent,
                style: textNormal(dateColor, 14),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                    child: ButtonCustomBottom(
                      isColorBlue: false,
                      title: btnLeftTxt,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: ButtonCustomBottom(
                      isColorBlue: true,
                      title: btnRightTxt,
                      onPressed: () {
                        funcBtnRight();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
