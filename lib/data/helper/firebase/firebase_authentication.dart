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
}
