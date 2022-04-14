import 'package:ccvc_mobile/data/di/flutter_transformer.dart';
import 'package:ccvc_mobile/domain/env/model/app_constants.dart';
import 'package:ccvc_mobile/domain/locals/prefs_service.dart';

import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

enum BaseURLOption { GATE_WAY, COMMON, CCVC, API_AND_UAT }

void configureDependencies() {

  //login
  // Get.put(AccountService(provideDio(baseOption: BaseURLOption.COMMON)));
  // Get.put(
  //     AccountServiceGateWay(provideDio(baseOption: BaseURLOption.GATE_WAY)));
  // Get.put<AccountRepository>(
  //   AccountImpl(Get.find(), Get.find()),
  // );

  // lich lam viec
}

int _connectTimeOut = 60000;

Dio provideDio({BaseURLOption baseOption = BaseURLOption.CCVC}) {
  final appConstants = Get.find<AppConstants>();
  String baseUrl = appConstants.baseUrlCCVC;

  final options = BaseOptions(
    baseUrl: baseUrl,
    receiveTimeout: _connectTimeOut,
    connectTimeout: _connectTimeOut,
    followRedirects: false,
  );
  final dio = Dio(options);
  dio.transformer = FlutterTransformer();
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        options.baseUrl = options.baseUrl;
        final token = PrefsService.getToken();
        if (token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        options.headers['Content-Type'] = 'application/json';
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response); // continue
      },
      onError: (DioError e, handler) => handler.next(e),
    ),
  );
  if (Foundation.kDebugMode) {
    dio.interceptors.add(dioLogger());
  }
  return dio;
}

PrettyDioLogger dioLogger() {
  return PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    maxWidth: 100,
  );
}
