
import 'dart:developer';
import 'package:alilogi/commons/app_utils.dart';
import 'package:alilogi/commons/app_validate.dart';
import 'package:alilogi/commons/constants/app_constants.dart';
import 'package:alilogi/commons/constants/app_routes.dart';
import 'package:alilogi/domain/entities/user_entity.dart';
import 'package:alilogi/domain/requests/login_request.dart';
import 'package:alilogi/domain/requests/register_request.dart';
import 'package:alilogi/domain/usecase/authentication_usecase.dart';
import 'package:alilogi/presentation/controllers/mixin_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController with MixinController {
  Rx<ButtonState> buttonState = ButtonState.active.obs;

  final AuthenticationUseCase authUseCase;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  RxString errorText = ''.obs;

  RxString emailValidate = ''.obs;
  RxString passwordValidate = ''.obs;
  RxString confirmPasswordValidate = ''.obs;

  RxBool confirmPwdHasFocus = false.obs;
  RxBool emailHasFocus = false.obs;
  RxBool pwdHasFocus = false.obs;

  RxBool buttonEnable = false.obs;

  RegisterController({required this.authUseCase});

  void checkButtonEnable() {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      buttonEnable.value = true;
    } else {
      buttonEnable.value = false;
    }
  }

  void postRegister() async {
    buttonState.value = ButtonState.loading;
    errorText.value = '';
    emailValidate.value = AppValidate.validateEmail(emailController);
    passwordValidate.value = AppValidate.checkValidPassword(passwordController);

    if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      confirmPasswordValidate.value = 'Mật khẩu không trùng khớp';
    } else {
      confirmPasswordValidate.value = '';
    }
  //  Get.toNamed(AppRoute.saveInfo, arguments: UserEntity(id: 4958));
    if (emailValidate.value.isEmpty &&
        passwordValidate.value.isEmpty &&
        confirmPasswordValidate.value.isEmpty) {
      final request = RegisterRequest(
          email: emailController.text,
          password: passwordController.text,
          pwConfirmation: confirmPasswordController.text);
      final result = await authUseCase.register(request);

      if (result.msg!.errorMsg == 'success') {
        log('đăng ký thành công');
        FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
        String? fcmToken = await authUseCase.getFcmToken();
        if(AppUtils.isNullEmpty(fcmToken))
        {
          fcmToken = await firebaseMessaging.getToken();
          if (AppUtils.isNullEmpty(fcmToken)) {
            await authUseCase.saveFcmToken(fcmToken!);
          }
        }
        final loginRequest = LoginRequest(
            email: emailController.text, password: passwordController.text, fcmToken: fcmToken);
        final loginResult = await authUseCase.login(loginRequest);

        if (loginResult.msg!.errorMsg == 'success') {
          log('đăng nhập thành công');
          await authUseCase.saveToken(loginResult.data!.accessToken!);
          //go to save info
          //  Get.toNamed(AppRoute.saveInfo);
          Get.toNamed(AppRoute.saveInfo, arguments: {
            'user':loginResult.data!.user!,
            'email': emailController.text,
            'password': passwordController.text
          });
        }
      } else {
        log('đăng ký thất bại');
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
    confirmPwdHasFocus.value = false;
    emailHasFocus.value = true;
  }

  void onEditingCompleteEmail() {
    pwdHasFocus.value = true;
    emailHasFocus.value = false;
    FocusScope.of(context!).requestFocus(passwordFocusNode);
  }

  void onChangedPwd() {
    checkButtonEnable();
    passwordValidate.value = '';
  }

  void onTapPwdTextField() {
    pwdHasFocus.value = true;
    confirmPwdHasFocus.value = false;
    emailHasFocus.value = false;
  }

  void onEditingCompletePwd() {
    pwdHasFocus.value = false;
    confirmPwdHasFocus.value = true;
    FocusScope.of(context!).requestFocus(confirmPasswordFocusNode);
  }

  void onChangedConfirmPwd() {
    checkButtonEnable();
    confirmPasswordValidate.value = '';
  }

  void onTapConfirmPwdTextField() {
    pwdHasFocus.value = false;
    confirmPwdHasFocus.value = true;
    emailHasFocus.value = false;
  }

  void onEditingCompleteConfirmPwd() {
    confirmPwdHasFocus.value = false;
    FocusScope.of(context!).unfocus();
    if (buttonEnable.value) {
      postRegister();
    }
  }

  void onPressedRegister() {
    pwdHasFocus.value = false;
    confirmPwdHasFocus.value = false;
    emailHasFocus.value = false;
    if (buttonEnable.value) {
      postRegister();
    }
  }

  onPressLogin() {
    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
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
    confirmPasswordFocusNode.addListener(() {
      confirmPwdHasFocus.value = confirmPasswordFocusNode.hasFocus;
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
