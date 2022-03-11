import 'package:ccvc_mobile/tien_ich_module/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ccvc_mobile/tien_ich_module/data/response/topic_hdsd_response.dart';

part 'tien_ich_service.g.dart';

@RestApi()
abstract class TienIchService {
  @factoryMethod
  factory TienIchService(Dio dio, {String baseUrl}) = _TienIchService;

  @GET(ApiConstants.TOPIC_HDSD)
  Future<DataTopicHDSDResponse> getTopicHDSD();




}
