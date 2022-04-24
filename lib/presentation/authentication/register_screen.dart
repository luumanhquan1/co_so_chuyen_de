import 'dart:developer';

import 'package:alilogi/commons/constants/app_dimens.dart';
import 'package:alilogi/commons/constants/image_constants.dart';
import 'package:alilogi/commons/constants/string_constants.dart';
import 'package:alilogi/presentation/controllers/login_controller.dart';
import 'package:alilogi/presentation/controllers/register_controller.dart';
import 'package:alilogi/presentation/journey/authentication/widgets/header_widget.dart';
import 'package:alilogi/presentation/journey/widgets/app_button.dart';
import 'package:alilogi/presentation/journey/widgets/app_image.dart';
import 'package:alilogi/presentation/journey/widgets/app_textfield.dart';
import 'package:alilogi/presentation/journey/widgets/app_touchable.dart';
import 'package:alilogi/presentation/theme/theme_color.dart';
import 'package:alilogi/presentation/theme/theme_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeaderWidget(
              title: StringConstants.welcomeText,
              subtitle: "Đăng ký tài khoản mới",
            ),
            SizedBox(
              height: AppDimens.height_68,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.width_16),
              child: Obx(() => AppTextField(
                    prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 18.sp, right: 12.sp),
                        child: Container(
                            width: 20.sp,
                            height: 20.sp,
                            child: AppImage.asset(
                                fit: BoxFit.scaleDown,
                                path: ImageConstants.icMessage,
                                color: controller.emailHasFocus.value
                                    ? AppColors.primary
                                    : AppColors.grey))),
                    hintText: 'Email',
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    onChangedText: (value) => controller.onChangedEmail(),
                    onTap: () => controller.onTapEmailTextField(),
                    errorText: controller.emailValidate.value,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () =>
                        controller.onEditingCompleteEmail(),
                    focusNode: controller.emailFocusNode,
                  )),
            ),
            SizedBox(
              height: AppDimens.height_10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.width_16),
              child: Obx(() => AppTextField(
                    prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 18.sp, right: 12.sp),
                        child: Container(
                            width: 20.sp,
                            height: 20.sp,
                            child: AppImage.asset(
                                fit: BoxFit.scaleDown,
                                path: ImageConstants.icPassword,
                                color: controller.pwdHasFocus.value
                                    ? AppColors.primary
                                    : AppColors.grey))),
                    hintText: StringConstants.password,
                    errorText: controller.passwordValidate.value,
                    obscureText: true,
                    controller: controller.passwordController,
                    onChangedText: (value) => controller.onChangedPwd(),
                    onTap: () => controller.onTapPwdTextField(),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => controller.onEditingCompletePwd(),
                    focusNode: controller.passwordFocusNode,
                  )),
            ),
            SizedBox(
              height: AppDimens.height_10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.width_16),
              child: Obx(() => AppTextField(
                    prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 18.sp, right: 12.sp),
                        child: Container(
                            width: 20.sp,
                            height: 20.sp,
                            child: AppImage.asset(
                                fit: BoxFit.scaleDown,
                                path: ImageConstants.icPassword,
                                color: controller.confirmPwdHasFocus.value
                                    ? AppColors.primary
                                    : AppColors.grey))),
                    hintText: 'Xác nhận mật khẩu',
                    controller: controller.confirmPasswordController,
                    obscureText: true,
                    errorText: controller.confirmPasswordValidate.value,
                    onChangedText: (value) => controller.onChangedConfirmPwd(),
                    onTap: () => controller.onTapConfirmPwdTextField(),
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () =>
                        controller.onEditingCompleteConfirmPwd(),
                    focusNode: controller.confirmPasswordFocusNode,
                  )),
            ),
            Obx(
              () => Visibility(
                visible: controller.errorText.isNotEmpty,
                child: SizedBox(
                  height: AppDimens.height_5,
                ),
              ),
            ),
            Obx(
              () => Visibility(
                  visible: controller.errorText.value.isNotEmpty,
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: AppDimens.width_16),
                    width: MediaQuery.of(context).size.width -
                        AppDimens.width_16 * 2,
                    child: Text(
                      controller.errorText.value,
                      style: ThemeText.heading6.copyWith(color: AppColors.red),
                    ),
                  )),
            ),
            SizedBox(
              height: AppDimens.height_20,
            ),
            Obx(() => AppButton(
                  title: 'Đăng ký',
                  onPressed: () => controller.onPressedRegister(),
                  buttonState: controller.buttonState.value,
                )),
            SizedBox(
              height: AppDimens.height_116,
            ),
            RichText(
              text: TextSpan(
                text: 'Bạn đã có tài khoản? ',
                style: ThemeText.body6.copyWith(
                  color: AppColors.grey,
                  height: 1.5,
                  fontFamily: 'Poppins',
                ),
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: AppTouchable(
                      onPressed: () {
                        controller.onPressLogin();
                      },
                      child: Text(
                        'Đăng nhập',
                        style: ThemeText.link2.copyWith(
                          color: AppColors.primary,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppDimens.height_113,
            ),
          ],
        ),
      ),
    );
  }
}
