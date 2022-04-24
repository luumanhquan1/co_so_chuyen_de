import 'package:alilogi/commons/configs/fcm_config.dart';
import 'package:alilogi/datasources/datasources/local/app_preference.dart';
import 'package:alilogi/datasources/datasources/local/app_preference_impl.dart';
import 'package:alilogi/datasources/datasources/local/pref.dart';
import 'package:alilogi/datasources/datasources/remote/authentication_datasource.dart';
import 'package:alilogi/datasources/datasources/remote/cart_datasource.dart';
import 'package:alilogi/datasources/datasources/remote/exchange_rate_datasource.dart';
import 'package:alilogi/datasources/datasources/remote/notification_datasource.dart';
import 'package:alilogi/datasources/datasources/remote/profile_datasource.dart';
import 'package:alilogi/datasources/datasources/remote/report_datasource.dart';
import 'package:alilogi/datasources/datasources/remote/transaction_datasource.dart';
import 'package:alilogi/datasources/repositories/authentication_repository_impl.dart';
import 'package:alilogi/datasources/repositories/cart_repository_impl.dart';
import 'package:alilogi/datasources/repositories/exchange_rate_repository_impl.dart';
import 'package:alilogi/datasources/repositories/notification_repository_impl.dart';
import 'package:alilogi/datasources/repositories/profile_repository_impl.dart';
import 'package:alilogi/datasources/repositories/report_repository_impl.dart';
import 'package:alilogi/datasources/repositories/transaction_repository_impl.dart';
import 'package:alilogi/domain/repositories/authentication_repository.dart';
import 'package:alilogi/domain/repositories/cart_repository.dart';
import 'package:alilogi/domain/repositories/exchange_rate_repository.dart';
import 'package:alilogi/domain/repositories/notification_repository.dart';
import 'package:alilogi/domain/repositories/profile_repository.dart';
import 'package:alilogi/domain/repositories/report_repository.dart';
import 'package:alilogi/domain/repositories/transaction_repository.dart';
import 'package:alilogi/domain/usecase/authentication_usecase.dart';
import 'package:alilogi/domain/usecase/cart_usecase.dart';
import 'package:alilogi/domain/usecase/exchange_rate_usecase.dart';
import 'package:alilogi/domain/usecase/notification_usecase.dart';
import 'package:alilogi/domain/usecase/profile_usecase.dart';
import 'package:alilogi/domain/usecase/report_usecase.dart';
import 'package:alilogi/domain/usecase/transaction_usecase.dart';
import 'package:alilogi/presentation/controllers/Salaries_report_controller.dart';
import 'package:alilogi/presentation/controllers/app_controller.dart';
import 'package:alilogi/presentation/controllers/cart_controller.dart';
import 'package:alilogi/presentation/controllers/change_password_controller.dart';
import 'package:alilogi/presentation/controllers/detail_report_controller.dart';
import 'package:alilogi/presentation/controllers/forgot_password_controller.dart';
import 'package:alilogi/presentation/controllers/general_report_controller.dart';
import 'package:alilogi/presentation/controllers/home_controller.dart';
import 'package:alilogi/presentation/controllers/item_controller.dart';
import 'package:alilogi/presentation/controllers/list_report_controller.dart';
import 'package:alilogi/presentation/controllers/login_controller.dart';
import 'package:alilogi/presentation/controllers/main_controller.dart';
import 'package:alilogi/presentation/controllers/notification_controller.dart';
import 'package:alilogi/presentation/controllers/notification_detail_controller.dart';
import 'package:alilogi/presentation/controllers/personal_controller.dart';
import 'package:alilogi/presentation/controllers/profile_controller.dart';
import 'package:alilogi/presentation/controllers/purchase_order_controller.dart';
import 'package:alilogi/presentation/controllers/purchase_order_detail_controller.dart';
import 'package:alilogi/presentation/controllers/register_controller.dart';
import 'package:alilogi/presentation/controllers/Sales_report_controller.dart';
import 'package:alilogi/presentation/controllers/save_infomation_controller.dart';
import 'package:alilogi/presentation/controllers/transaction_controller.dart';
import 'package:alilogi/presentation/controllers/transport_code_list_controller.dart';
import 'package:alilogi/presentation/controllers/transport_order_controller.dart';
import 'package:alilogi/presentation/controllers/transport_order_detail_controller.dart';
import 'package:alilogi/presentation/controllers/weight_controller.dart';
import 'package:alilogi/presentation/journey/general_information/general_report_screen.dart';
import 'package:alilogi/presentation/journey/splash/splash_controller.dart';
import 'package:get_it/get_it.dart';

import '../network/http/dio_config.dart';
import '../network/network_info.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  /// GetX
  locator.registerFactory<AppController>(() => AppController(
        locator<AuthenticationUseCase>(),
      ));
  locator.registerFactory<SplashController>(() => SplashController(
      profileUseCase: locator<ProfileUseCase>(),
      authUseCase: locator<AuthenticationUseCase>(),
      ));
  locator.registerFactory<LoginController>(() => LoginController(
        authUseCase: locator<AuthenticationUseCase>(),
      ));
  locator.registerFactory<RegisterController>(() => RegisterController(
        authUseCase: locator<AuthenticationUseCase>(),
      ));
  locator
      .registerFactory<ForgotPasswordController>(() => ForgotPasswordController(
            authUseCase: locator<AuthenticationUseCase>(),
          ));
  locator.registerFactory<SaveInfoController>(() => SaveInfoController(
        profileUseCase: locator<ProfileUseCase>(),
        authUseCase: locator<AuthenticationUseCase>(),
      ));
  locator.registerFactory<MainController>(() => MainController(
        authUseCase: locator<AuthenticationUseCase>(),
        profileUseCase: locator<ProfileUseCase>(),
      fcmConfig: locator<FcmConfig>()
      ));
  locator.registerFactory<HomeController>(() => HomeController());
  locator.registerFactory<CartController>(() => CartController(
        profileUseCase: locator<ProfileUseCase>(),
        cartUsecase: locator<CartUsecase>(),
        authUseCase: locator<AuthenticationUseCase>(),
        exchangeRateUseCase: locator<ExchangeRateUseCase>(),
      ));
  locator.registerFactory<NotificationController>(() => NotificationController(
        notificationUseCase: locator<NotificationUseCase>(),
        authUseCase: locator<AuthenticationUseCase>(),
      ));
  locator.registerFactory<TransactionController>(() => TransactionController(
        transactionUseCase: locator<TransactionUseCase>(),
        authUseCase: locator<AuthenticationUseCase>(),
      ));
  locator.registerFactory<PersonalController>(() => PersonalController(
        authUseCase: locator<AuthenticationUseCase>(),
      ));
  locator.registerFactory<ProfileController>(() => ProfileController(
        profileUseCase: locator<ProfileUseCase>(),
        authUseCase: locator<AuthenticationUseCase>(),
      ));
  locator
      .registerFactory<ChangePasswordController>(() => ChangePasswordController(
            profileUseCase: locator<ProfileUseCase>(),
            authUseCase: locator<AuthenticationUseCase>(),
          ));
  locator.registerFactory<NotificationDetailController>(
      () => NotificationDetailController(
            notificationUseCase: locator<NotificationUseCase>(),
          ));
  locator.registerFactory<ItemController>(
      () => ItemController(cartUsecase: locator<CartUsecase>()));
  locator.registerFactory<PurchaseOrderController>(() =>
      PurchaseOrderController(
          exchangeRateUseCase: locator<ExchangeRateUseCase>(),
          transactionUseCase: locator<TransactionUseCase>()));
  locator.registerFactory<PurchaseOrderDetailController>(() =>
      PurchaseOrderDetailController(
          transactionUseCase: locator<TransactionUseCase>()));
  locator.registerFactory<TransportOrderController>(() =>
      TransportOrderController(
          transactionUseCase: locator<TransactionUseCase>()));
  locator.registerFactory<TransportOrderDetailController>(() =>
      TransportOrderDetailController(
          transactionUseCase: locator<TransactionUseCase>(),
         ));
  locator.registerFactory<TransportCodeController>(() =>
      TransportCodeController(
          transactionUseCase: locator<TransactionUseCase>()));
  locator.registerFactory<WeightWalletController>(() => WeightWalletController(
    transactionUseCase: locator<TransactionUseCase>(),
  ));
  locator.registerFactory<GeneralReportController>(() => GeneralReportController(
      reportUseCase: locator<ReportUseCase>(),
  ));
  locator.registerFactory<ListReportController>(() => ListReportController(
    reportUseCase: locator<ReportUseCase>(),
  ));
  locator.registerFactory<DetailReportController>(() => DetailReportController(
    reportUseCase: locator<ReportUseCase>(),
  ));
  locator.registerFactory<SalariesReportController>(() => SalariesReportController(
    reportUseCase: locator<ReportUseCase>(),
  ));
  locator.registerFactory<SalesReportController>(() => SalesReportController(
    reportUseCase: locator<ReportUseCase>(),
  ));

  /// Usecases
  locator.registerFactory<AuthenticationUseCase>(() => AuthenticationUseCase(
        authRepo: locator<AuthenticationRepository>(),
      ));
  locator.registerFactory<ProfileUseCase>(() => ProfileUseCase(
        profileRepository: locator<ProfileRepository>(),
      ));
  locator.registerFactory<ExchangeRateUseCase>(() => ExchangeRateUseCase(
        exchangeRateRepo: locator<ExchangeRateRepository>(),
      ));
  locator.registerFactory<TransactionUseCase>(() => TransactionUseCase(
        transactionRepo: locator<TransactionRepository>(),
      ));
  locator.registerFactory<NotificationUseCase>(() => NotificationUseCase(
        notificationRepo: locator<NotificationRepository>(),
      ));
  locator.registerFactory<CartUsecase>(() => CartUsecase(
        cartRepository: locator<CartRepository>(),
      ));
  locator.registerFactory<ReportUseCase>(() => ReportUseCase(
    locator<ReportRepository>(),
  ));

  /// Repositories
  locator.registerFactory<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(
            authDataSource: locator<AuthenticationDataSource>(),
            appPref: locator<AppPreference>(),
          ));
  locator.registerFactory<ProfileRepository>(() => ProfileRepositoryImpl(
        profileDataSource: locator<ProfileDataSource>(),
      ));
  locator
      .registerFactory<ExchangeRateRepository>(() => ExchangeRateRepositoryImpl(
            exchangeRateDS: locator<ExchangeRateDataSource>(),
          ));
  locator
      .registerFactory<TransactionRepository>(() => TransactionRepositoryImpl(
            transactionDS: locator<TransactionDataSource>(),
          ));
  locator.registerFactory<NotificationRepository>(() =>
      NotificationRepositoryImpl(
          notificationDS: locator<NotificationDataSource>()));
  locator.registerFactory<CartRepository>(
      () => CartRepositoryImpl(cartDatasource: locator<CartDatasource>()));
  locator.registerFactory<ReportRepository>(
          () => ReportRepositoryImpl(reportDataSource: locator<ReportDataSource>()));

  /// DataSources
  locator.registerLazySingleton<AppPreference>(
      () => AppPreferenceImpl(pref: locator<Pref>()));
  locator.registerLazySingleton<Pref>(() => LocalPref());
  locator.registerLazySingleton<AuthenticationDataSource>(
      () => AuthenticationDataSource(dio));
  locator
      .registerLazySingleton<ProfileDataSource>(() => ProfileDataSource(dio));
  locator.registerLazySingleton<ExchangeRateDataSource>(
      () => ExchangeRateDataSource(dio));
  locator.registerLazySingleton<TransactionDataSource>(
      () => TransactionDataSource(dio));
  locator.registerLazySingleton<NotificationDataSource>(
      () => NotificationDataSource(dio));
  locator.registerLazySingleton<CartDatasource>(() => CartDatasource(dio));
  locator.registerLazySingleton<ReportDataSource>(() => ReportDataSource(dio));

  /// Common
  locator.registerLazySingleton<FcmConfig>(
      () => FcmConfig(locator<AuthenticationUseCase>()));

  /// Network
  locator.registerFactory<NetworkInfo>(() => NetworkInfoImpl());
}
