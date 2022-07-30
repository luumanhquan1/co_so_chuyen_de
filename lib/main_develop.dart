import 'package:ccvc_mobile/config/crypto_config.dart';
import 'package:ccvc_mobile/domain/env/develop.dart';
import 'package:ccvc_mobile/domain/env/model/app_constants.dart';
import 'package:ccvc_mobile/main.dart';
import 'package:get/get.dart';

Future<void> main() async {
  Get.put(AppConstants.fromJson(configDevEnv));
  CryptoConfig.encode({'1':'1'});
  await mainApp();
}
