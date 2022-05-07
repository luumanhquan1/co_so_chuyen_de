import 'dart:async';

import 'package:ccvc_mobile/domain/model/login/user_info.dart';
import 'package:hive/hive.dart';
import 'package:queue/queue.dart';

class HiveLocal {
  static const USER_INFO = 'USER_INFO';
  static late Box<UserInfoModel> _userBox;

  static Future<void> init() async {
    Hive.registerAdapter(UserInfoModelAdapter());
    _userBox = await Hive.openBox(USER_INFO);



  }

  static void saveDataUser(UserInfoModel user) {
    _userBox.add(user);
  }

  static UserInfoModel? getDataUser() {
    final data = _userBox.values;
    if(data.isNotEmpty) {
      return data.first;
    }
  }
}
