import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'firebase_const.dart';

class FirebaseAuthentication {
  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    User? user;

    try {
      final UserCredential userCredential =
          await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on Exception catch (e) {
      if (e.toString() ==
              '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.' ||
          e.toString() ==
              '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.') {
        EXCEPTION_LOGIN = S.current.tai_khoan_hoac_mat_khau_khong_chinh_xac;
      }
      print(e.toString());
    }
    return user;
  }

  static Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    User? user;

    try {
      final UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);

      user = userCredential.user;
    } on Exception catch (e) {
      if (e.toString() ==
          '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
        EXCEPTION_LOGIN = S.current.email_da_duoc_su_dung;
      }
      if (e.toString() ==
          '[firebase_auth/weak-password] Password should be at least 6 characters') {
        EXCEPTION_LOGIN = S.current.password_dai_hon_6_ky_tu;
      }
      if (e.toString() ==
          '[firebase_auth/invalid-email] The email address is badly formatted.') {
        EXCEPTION_LOGIN = S.current.email_sai_dinh_dang;
      }
      print(e.toString());
    }
    return user;
  }

  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<void> changePassword({
    required String newPassword,
    required Function() subsess,
    required Function(String e) error,
  }) async {
    final user = FirebaseAuth.instance.currentUser;

    return await user?.updatePassword(newPassword).then((value) {
      subsess();
    }).catchError((e) {
      if (e.toString() ==
          '[firebase_auth/weak-password] Password should be at least 6 characters') {
        EXCEPTION_CHANGE_PASSWORD = S.current.password_dai_hon_6_ky_tu;
      } else {
        EXCEPTION_CHANGE_PASSWORD = e.toString();
      }
      error(EXCEPTION_CHANGE_PASSWORD);
      print('$e');
      //Error, show something
    });
  }
}
