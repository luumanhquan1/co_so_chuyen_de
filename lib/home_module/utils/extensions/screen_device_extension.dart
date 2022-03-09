
import 'package:flutter/cupertino.dart';
import '/home_module/utils/constants/app_constants.dart';
import '/home_module/config/app_config.dart';
Widget screenDevice({
  required Widget mobileScreen,
  required Widget tabletScreen,
}) {
  if (APP_DEVICE == DeviceType.MOBILE) {
    return mobileScreen;
  } else {
    return tabletScreen;
  }
}

bool isMobile() {
  if (APP_DEVICE == DeviceType.MOBILE) {
    return true;
  } else {
    return false;
  }
}
