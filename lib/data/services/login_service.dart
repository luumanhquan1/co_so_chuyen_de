import 'package:ccvc_mobile/data/response/account/login_response.dart';
import 'package:ccvc_mobile/utils/constants/api_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'login_service.g.dart';

@RestApi()
abstract class LoginClient {
  @factoryMethod
  factory LoginClient(Dio dio, {String baseUrl}) = _LoginClient;

  @POST(ApiConstants.LOGIN)
  Future<LoginResponse> login(@Field('username') String userName,
      @Field('password') String passWord,@Field('appCode') String appCode);

}