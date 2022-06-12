import 'dart:async';

import 'package:hive/hive.dart';
import 'package:queue/queue.dart';

import '../model/login/user_info.dart';

class HiveLocal {
  static const USER_INFO = 'USER_INFO';
 static late Box<UserInfoModel> _userBox;

  static Future<void> init() async {
    Hive.registerAdapter(UserInfoModelAdapter());

    final que = Queue(parallel: 5);

    unawaited(que.add(() async => _userBox = await Hive.openBox(USER_INFO)));
    await que.onComplete;
    que.cancel();
  }

  static void removeDataUser() {
    _userBox.clear();
  }

  static void saveDataUser(UserInfoModel user) {
    _userBox.add(user);
  }

  static UserInfoModel? getDataUser() {
    final data = _userBox.values;
    if(data.isNotEmpty) {
      return data.first;
    }
    return null;
  }
}
