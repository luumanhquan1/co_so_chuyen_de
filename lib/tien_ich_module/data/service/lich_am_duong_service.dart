import 'package:ccvc_mobile/tien_ich_module/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ccvc_mobile/tien_ich_module/data/response/lich_am_duong_response.dart';

part 'lich_am_duong_service.g.dart';

@RestApi()
abstract class LichAmDuongService {
  @factoryMethod
  factory LichAmDuongService(Dio dio, {String baseUrl}) = _LichAmDuongService;


  @GET(ApiConstants.GET_LICH_AM_DUONG)
  Future<DataLichAmDuongResponse> getLichAmDuong(
      @Query('dateStr') String date,
      );
}
