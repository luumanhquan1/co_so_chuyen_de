import 'dart:developer';

import 'package:ccvc_mobile/config/default_env.dart';
import 'package:ccvc_mobile/config/firebase_config.dart';

class UserRepopsitory{

  FirebaseSetup firebaseSetup = FirebaseSetup();



  Future<Map> getUserProfile({required String userId}) async {
    final response = await firebaseSetup.usersCollection.doc(userId).collection(DefaultEnv.profileCollection).get();
    if (response.docs == null) {
      return {};
    } else {
      Map data = Map();
      for(var x in response.docs)
      {
        log(x.data().toString());
        data.addAll({x.id:x.data()});
      }

      return data;
    }
  }
}