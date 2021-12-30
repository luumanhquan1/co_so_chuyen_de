import 'package:ccvc_mobile/config/app_config.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';

class AppTheme {
  static AppColor? _instance;

  static AppColor getInstance() {
    _instance ??= AppMode.LIGHT == APP_THEME ? LightApp() : DarkApp();
    return _instance!;
  }
}
