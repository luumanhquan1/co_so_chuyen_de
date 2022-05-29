import 'dart:developer';

import 'package:ccvc_mobile/config/default_env.dart';
import 'package:ccvc_mobile/config/firebase_config.dart';
import 'package:ccvc_mobile/domain/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepopsitory {
  FirebaseSetup firebaseSetup = FirebaseSetup();

  Future<UserModel?> getUserProfile({required String userId}) async {
    final response = await FirebaseFirestore.instance
        .collection(DefaultEnv.appCollection)
        .doc(DefaultEnv.developDoc)
        .collection(DefaultEnv.usersCollection)
        .doc(userId)
        .collection('profile')
        .get();
    // firebaseSetup.usersCollection.doc(userId).collection(DefaultEnv.profileCollection).get();
    if (response.docs == null) {
      return null;
    } else {
      Map<String, dynamic> data = Map<String, dynamic>();
      for (var y in response.docs) {
        data = y.data();
        data.addAll({'user_id': userId});
        log('1111' + data.toString());
        return UserModel.fromJson(data);
      }
      return UserModel.fromJson(data);
    }
  }

  Future<bool> updateOnline(
      {required String userId, required bool onlineFlag}) async {
    try {
      await FirebaseFirestore.instance
          .collection(DefaultEnv.appCollection)
          .doc(DefaultEnv.developDoc)
          .collection(DefaultEnv.usersCollection)
          .doc(userId)
          .update({'online_flag': onlineFlag});
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
