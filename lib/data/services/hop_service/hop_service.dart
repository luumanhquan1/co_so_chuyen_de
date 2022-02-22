
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'hop_service.g.dart';

@RestApi()
abstract class HopService {
  @factoryMethod
  factory HopService(Dio dio, {String baseUrl}) = _HopService;
}
