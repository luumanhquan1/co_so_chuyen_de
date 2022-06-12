import 'dart:developer';

import 'package:ccvc_mobile/config/default_env.dart';
import 'package:ccvc_mobile/config/firebase_config.dart';
import 'package:ccvc_mobile/domain/model/profile_model.dart/friend_model.dart';

import '../../domain/model/login/user_info.dart';

class ProfileService {
  static Future<List<UserInfoModel>> listFriends(String id) async {
    final List<UserInfoModel> data = [];
    final result = await FirebaseSetup.fireStore
        .collection(DefaultEnv.usersCollection)
        .doc(id)
        .collection(DefaultEnv.relationshipsCollection)
        .limit(15)
        .get();
    // log('${data.docs.length}');
    for (var element in result.docs) {
      final vl = FriendModel.fromJson(element.data());
      final user = await getUserChat(vl.userId2);
      if (user != null) {
        data.add(user);
      }
    }
    return data;
  }

  static Future<UserInfoModel?> getUserChat(String id) async {
    UserInfoModel? userProfile;
    final result = await FirebaseSetup.fireStore
        .collection(DefaultEnv.usersCollection)
        .doc(id)
        .collection(DefaultEnv.profileCollection)
        .get();

    for (final element in result.docs) {
      userProfile = UserInfoModel.fromJson(element.data());
    }
    return userProfile;
  }
}
