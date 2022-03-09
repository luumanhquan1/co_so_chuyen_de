import '/home_module/config/app_config.dart';
import 'package:flutter/material.dart';
import '/home_module/utils/constants/app_constants.dart';
extension SizeInt on int {
  int textScale({int space = 2}) {
    return APP_DEVICE == DeviceType.MOBILE ? this : this + space;
  }
}

extension SizeDouble on double {
  double textScale({double space = 2}) {
    return APP_DEVICE == DeviceType.MOBILE ? this : this + space;
  }
}

