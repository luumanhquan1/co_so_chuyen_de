import 'package:ccvc_mobile/config/app_config.dart';

import 'package:ccvc_mobile/domain/locals/prefs_service.dart';

import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class AppState {
  String token = '';
  final BehaviorSubject<String> getToken = BehaviorSubject<String>();
  void getTokenPrefs() {
    token = PrefsService.getToken();
    getToken.sink.add(token);
  }

  void setToken(String token) {
    PrefsService.saveToken(token);
    this.token = token;
    getToken.sink.add(token);
  }

  void setAppMode(AppMode appMode) {
    APP_THEME = appMode;
    Get.forceAppUpdate();
  }

  void setAppBackGround(AppBackGround appBackGround) {
    if (appBackGround == APP_BACKGROUND) {
      APP_BACKGROUND = null;
    } else {
      APP_BACKGROUND = appBackGround;
    }
    Get.forceAppUpdate();
  }
}
