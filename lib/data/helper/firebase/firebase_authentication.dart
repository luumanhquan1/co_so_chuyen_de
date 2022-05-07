import 'package:ccvc_mobile/config/base/base_cubit.dart';
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
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }
    return user;
  }
}
