import 'dart:math';

import 'package:alilogi/commons/app_utils.dart';
import 'package:alilogi/commons/constants/app_constants.dart';
import 'package:alilogi/commons/constants/app_dimens.dart';
import 'package:alilogi/presentation/journey/widgets/app_button.dart';
import 'package:alilogi/presentation/theme/theme_color.dart';
import 'package:alilogi/presentation/theme/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'app_image.dart';

Future showAppDialog(BuildContext context, String titleText, String messageText,
    {Widget? messageWidget,
    String? iconPath,
    bool isIconSvg = false,
    bool customBody = false,
    Widget? widgetBody,
    required String firstButtonText,
    Color firstButtonColor = AppColors.primary,
    VoidCallback? firstButtonCallback,
    ButtonState? firstButtonState,
    String? secondButtonText,
    Color secondButtonColor = AppColors.white,
    VoidCallback? secondButtonCallback,
    bool dismissAble = false,
    WidgetBuilder? builder,
    required TextAlign messageTextAlign}) {
  return showDialog(
    context: context,
    barrierDismissible: dismissAble,
    builder: builder ??
        (BuildContext context) => AppDialog(
              title: titleText,
              message: messageText,
              messageWidget: messageWidget,
              iconPath: iconPath,
              isIconSvg: isIconSvg,
              customBody: customBody,
              widgetBody: widgetBody,
              firstButtonText: firstButtonText,
              firstButtonColor: firstButtonColor,
              firstButtonCallback: firstButtonCallback,
              firstButtonState: firstButtonState,
              secondButtonText: secondButtonText,
              secondButtonCallback: secondButtonCallback,
              //  firstBtnState: firstBtnState,
              messageTextAlign: messageTextAlign,
            ),
  );
}

// Future showBioNotRecognizedDialog(
//     BuildContext context, {
//       String? bioType,
//       Function()? onRetry,
//     }) =>
//     showAppDialog(
//         context,
//         AppStrings.getString(
//             bioType == 'FACE_ID' ? StringConstants.faceNotRecognized : StringConstants.fingerprintNotRecognized),
//         AppStrings.getString(StringConstants.retry),
//         isIconSvg: true,
//         iconPath: bioType == 'FACE_ID' ? AppImages.icFaceId : AppImages.icFingerPrint,
//         firstButtonText: AppStrings.getString(StringConstants.retry),
//         firstButtonColor: ButtonColor.primary,
//         firstButtonCallback: () {
//           Get.back(result: false);
//         },
//         secondButtonText: AppStrings.getString(StringConstants.cancel),
//         secondButtonColor: ButtonColor.light,
//         secondButtonCallback: () {
//           Get.back(result: true);
//         });

class AppDialog extends StatelessWidget {
  final String? title;
  final String message;
  final Widget? messageWidget;
  final String? iconPath;
  final bool isIconSvg;
  final bool customBody;
  final bool dismissAble;
  final Widget? widgetBody;
  final String firstButtonText;
  final Color firstButtonColor;
  final VoidCallback? firstButtonCallback;
  final ButtonState? firstButtonState;
  final String? secondButtonText;
  final Color? secondButtonColor;
  final VoidCallback? secondButtonCallback;
//  final ButtonState? firstBtnState;
  final TextAlign messageTextAlign;

  const AppDialog(
      {Key? key,
      this.title,
      required this.message,
      this.messageWidget,
      this.iconPath,
      this.isIconSvg = false,
      this.customBody = false,
      this.dismissAble = false,
      this.widgetBody,
      required this.firstButtonText,
      required this.firstButtonColor,
      this.firstButtonCallback,
      this.secondButtonText,
      this.secondButtonColor,
      this.secondButtonCallback,
      required this.messageTextAlign,
      this.firstButtonState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var dialogWidth = min<double>(width * 0.86, 400);
    return WillPopScope(
      onWillPop: () async => dismissAble,
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(
        //     AppDimens.radius_5,
        //   ),
        // ),
        // elevation: 0.0,
        backgroundColor: AppColors.indigo,
        child: Container(
          //     margin: EdgeInsets.all(24.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppDimens.radius_5,
            ),
            color: AppColors.white,
          ),
          width: 343.w,
          child: Padding(
            padding: EdgeInsets.all(24.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppUtils.isNullEmpty(iconPath)
                    ? const SizedBox.shrink()
                    : Center(
                      child: AppImage.asset(
                          path: iconPath!,
                          height: AppDimens.height_35,
                          fit: BoxFit.fill,
                        ),
                    ),
                AppUtils.isNullEmpty(title)
                    ? const SizedBox.shrink()
                    : Text(
                        title!,
                        textAlign: TextAlign.start,
                        style: ThemeText.heading5
                            .copyWith(color: AppColors.indigo),
                      ),
                SizedBox(height: AppDimens.height_16),
                Text(
                  message,
                  textAlign: messageTextAlign,
                  style: ThemeText.body6.copyWith(color: AppColors.grey),
                ),
                SizedBox(height: AppDimens.space_16),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: AppButton(
                        margin: EdgeInsets.all(0),
                        title: firstButtonText,
                        onPressed: firstButtonCallback,
                        buttonState: firstButtonState ?? ButtonState.active,
                      ),
                    ),
                    if (secondButtonText != null)
                      Expanded(
                        child: AppButton(
                          margin: EdgeInsets.all(0),
                          borderRadius: BorderRadius.circular(0),
                          textStyle:
                              ThemeText.button.copyWith(color: AppColors.grey),
                          title: secondButtonText ?? '',
                          bgColor: AppColors.transparent,
                          onPressed: secondButtonCallback,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
