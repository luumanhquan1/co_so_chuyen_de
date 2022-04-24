import 'package:alilogi/commons/constants/app_dimens.dart';
import 'package:alilogi/commons/constants/image_constants.dart';
import 'package:alilogi/commons/constants/string_constants.dart';
import 'package:alilogi/presentation/controllers/login_controller.dart';
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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInScreen extends GetView<LoginController> {
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
              subtitle: "Vui lòng đăng nhập để tiếp tục",
            ),
            SizedBox(
              height: AppDimens.height_68,
            ),
            Obx(
              () => Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppDimens.width_16),
                  child: AppTextField(
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
                    hintText: StringConstants.username,
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    errorText: controller.emailValidate.value,
                    onChangedText: (value) => controller.onChangedEmail(),
                    onTap: () => controller.onTapEmailTextField(),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () =>
                        controller.onEditingCompleteEmail(),
                    focusNode: controller.emailFocusNode,
                  )),
            ),
            SizedBox(
              height: AppDimens.height_10,
            ),
            Obx(
              () => Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppDimens.width_16),
                  child: AppTextField(
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
                    controller: controller.passwordController,
                    errorText: controller.passwordValidate.value,
                    obscureText: true,
                    onChangedText: (value) => controller.onChangedPwd(),
                    onTap: () => controller.onTapPwdTextField(),
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () => controller.onEditingCompletePwd(),
                    focusNode: controller.passwordFocusNode,
                  )),
            ),
            Obx(
              () => Visibility(
                visible: controller.errorText.value.isNotEmpty,
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
                  title: 'Đăng nhập',
                  onPressed: () => controller.onPressedLogIn(),
                  buttonState: controller.buttonState.value,
                )),
            SizedBox(
              height: AppDimens.height_124,
            ),
            //Obx(() =>
            AppTouchable(
                onPressed: () => controller.onPressForgotPassword(),
                child: Text(
                  'Quên mật khẩu?',
                  style: ThemeText.link2.copyWith(color: AppColors.primary),
                  //    )
                )),
            SizedBox(
              height: AppDimens.height_8,
            ),
            RichText(
              text: TextSpan(
                text: 'Bạn chưa có tài khoản? ',
                style: ThemeText.body6.copyWith(
                  color: AppColors.grey,
                  height: 1.5,
                  fontFamily: 'Poppins',
                ),
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: AppTouchable(
                      onPressed: controller.onPressRegister,
                      child: Text(
                        'Đăng ký',
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
