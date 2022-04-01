import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'nhiem_vu_service.g.dart';

@RestApi()
abstract class NhiemVuService {

  @factoryMethod
  factory NhiemVuService(Dio dio, {String baseUrl}) = _NhiemVuService;
}
