import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:ccvc_mobile/widgets/button/button_custom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<T?> showDiaLogOneButton<T>(
    BuildContext context, {
      required String textContent,
      required Widget icon,
      required String btnRightTxt,
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
              ? MediaQuery.of(context).size.width / 2
              : double.maxFinite,
          // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          padding: EdgeInsets.fromLTRB(
            24,
            showTablet ? 24 : 40,
            24,
            showTablet ? 32 : 40,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                visible: showTablet,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: SvgPicture.asset(ImageAssets.icClose),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: showTablet ? 20.0.textScale(space: -8) : 20,
              ),
              icon,
              SizedBox(
                height: showTablet ? 20.0.textScale(space: -8) : 20,
              ),
              Text(
                textContent,
                style: titleAppbar(),
              ),
              SizedBox(
                height: showTablet ? 14.0.textScale() : 14,
              ),
              SizedBox(
                height: showTablet ? 24.0.textScale(space: 8) : 24,
              ),
              Row(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 86,
                    child: ButtonCustomBottom(
                      isColorBlue: true,
                      title: btnRightTxt,
                      onPressed: () {
                        funcBtnRight();
                        Navigator.pop(context,true);
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
