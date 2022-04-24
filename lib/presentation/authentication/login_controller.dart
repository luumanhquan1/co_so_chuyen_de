import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:alilogi/commons/app_utils.dart';
import 'package:alilogi/commons/app_validate.dart';
import 'package:alilogi/commons/constants/app_constants.dart';
import 'package:alilogi/commons/constants/app_routes.dart';
import 'package:alilogi/domain/requests/login_request.dart';
import 'package:alilogi/domain/usecase/authentication_usecase.dart';
import 'package:alilogi/presentation/controllers/mixin_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with MixinController {
  Rx<ButtonState> buttonState = ButtonState.active.obs;

  final AuthenticationUseCase authUseCase;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  RxString errorText = ''.obs;

  RxString emailValidate = ''.obs;
  RxString passwordValidate = ''.obs;

  RxBool buttonEnable = false.obs;
  RxBool emailHasFocus = false.obs;
  RxBool pwdHasFocus = false.obs;

  LoginController({required this.authUseCase});

  void checkButtonEnable() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      buttonEnable.value = true;
    } else {
      buttonEnable.value = false;
    }
  }

  void postLogin() async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    buttonState.value = ButtonState.loading;
    hideKeyboard();
    errorText.value = '';
    emailValidate.value = AppValidate.validateEmail(emailController);
    passwordValidate.value = AppValidate.checkValidPassword(passwordController);

    if (emailValidate.value.isEmpty && passwordValidate.value.isEmpty) {
      String? fcmToken = await authUseCase.getFcmToken();
      if(AppUtils.isNullEmpty(fcmToken))
      {
        fcmToken = await firebaseMessaging.getToken();
        if (AppUtils.isNullEmpty(fcmToken)) {
          await authUseCase.saveFcmToken(fcmToken!);
        }
      }
      final request = LoginRequest(
          email: emailController.text, password: passwordController.text, fcmToken: fcmToken);
     // final request = LoginRequest(email: 'tinodmilano92@gmail.com', password: 'Tinodvibes92');
      final result = await authUseCase.login(request);

      if (result.msg!.errorMsg == 'success') {
        log('đăng nhập thành công');
        await authUseCase.saveToken(result.data!.accessToken!);
        await authUseCase.saveUsername(emailController.text);
        await authUseCase.savePassword(passwordController.text).then((value) =>
            Get.offNamed(AppRoute.main));
        //go to main screen
        //   Get.offNamed(AppRoute.main, arguments: result.data!.user);
      } else {
        log('đăng nhập thất bại');
        errorText.value = result.msg!.errorMsg;
      }
    }

    buttonState.value = ButtonState.active;
  }

  void onChangedEmail() {
    checkButtonEnable();
    emailValidate.value = '';
  }

  void onTapEmailTextField() {
    pwdHasFocus.value = false;
    emailHasFocus.value = true;
  }

  void onEditingCompleteEmail() {
    emailHasFocus.value = false;
    pwdHasFocus.value = true;
    FocusScope.of(context!).requestFocus(passwordFocusNode);
  }

  void onChangedPwd() {
    checkButtonEnable();
    passwordValidate.value = '';
  }

  void onTapPwdTextField() {
    emailHasFocus.value = false;
    pwdHasFocus.value = true;
  }

  void onEditingCompletePwd() {
    pwdHasFocus.value = false;
    FocusScope.of(context!).unfocus();
    if (buttonEnable.value) {
      postLogin();
    }
  }

  void onPressedLogIn() {
    pwdHasFocus.value = false;
    emailHasFocus.value = false;
    if (buttonEnable.value) {
      postLogin();
    }
  }

  onPressForgotPassword() {
    Get.toNamed(AppRoute.forgotPassword);
  }

  onPressRegister() {
    Get.toNamed(AppRoute.register);
  }

  @override
  void onReady() async {
    super.onReady();
    emailFocusNode.addListener(() {
      emailHasFocus.value = emailFocusNode.hasFocus;
    });
    passwordFocusNode.addListener(() {
      pwdHasFocus.value = passwordFocusNode.hasFocus;
    });
  }
}
