import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/data/helper/firebase/firebase_authentication.dart';
import 'package:ccvc_mobile/data/helper/firebase/firebase_store.dart';
import 'package:ccvc_mobile/domain/locals/hive_local.dart';
import 'package:ccvc_mobile/domain/locals/prefs_service.dart';
import 'package:ccvc_mobile/domain/model/fcm_tokken_model.dart';
import 'package:ccvc_mobile/domain/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

import 'otp_state.dart';

class OtpCubit extends BaseCubit<OtpState> {
  OtpCubit() : super(OtpStateIntial());


  bool isUserModel = false;
  UserModel userInfo = UserModel.empty();
  FcmTokenModel tokenModel = FcmTokenModel.empty();

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    debugPrint('hello11oo');
    showLoading();
    debugPrint('helloo22oo');
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 15),
      verificationCompleted: (AuthCredential authCredential) {
       debugPrint("Your account is successfully verified");
      },
      verificationFailed: (e) {
        debugPrint(e.toString());
      },
      codeSent: (String verId, [int? forceCodeResent]) {
        showContent();
        debugPrint('helloo333333oo');
        // verificationId = verId;
        // setState(() {
        //   authStatus = "OTP has been successfully send";
        // });
        // otpDialogBox(context).then((value) {});
      },
      codeAutoRetrievalTimeout: (String verId) {
        // verificationId = verId;
        // setState(() {
        //   authStatus = "TIMEOUT";
        // });
        debugPrint(verId);
      },
    );
  }

  Future<void> saveUser() async {
    final String token = PrefsService.getToken();

    userInfo = await FireStoreMethod.getDataUserInfo(PrefsService.getUserId());

    await HiveLocal.saveDataUser(userInfo);
    tokenModel = FcmTokenModel(
      userId: userInfo.userId,
      tokenFcm: token,
      createAt: DateTime.now().millisecondsSinceEpoch,
      updateAt: DateTime.now().millisecondsSinceEpoch,
    );
  }

  Future<User?> lognIn(
      String email,
      String password,
      ) async {
    showLoading();
    final User? user = await FirebaseAuthentication.signInUsingEmailPassword(
      email: email,
      password: password,
    );
    isUserModel = await FireStoreMethod.isDataUser(user?.uid ?? '');

    await PrefsService.saveIsCreateInfo(isUserModel);

    if (user != null) {
      if (isUserModel) {
        await FirebaseMessaging.instance.getToken().then((value) async {
          await PrefsService.saveToken(value ?? '');
        });
        await PrefsService.saveUserId(user.uid);
        await PrefsService.savePasswordPresent(password);
        await saveUser();
        userInfo.onlineFlag = true;
        await HiveLocal.updateDataUser(userInfo);
        await FireStoreMethod.updateUser(userInfo.userId ?? '', userInfo);
        await FireStoreMethod.saveToken(
          userId: userInfo.userId ?? '',
          fcmTokenModel: tokenModel,
        );
      }
    }
    showContent();
    return user;
  }

  void closeDialog() {
    showContent();
  }
}
