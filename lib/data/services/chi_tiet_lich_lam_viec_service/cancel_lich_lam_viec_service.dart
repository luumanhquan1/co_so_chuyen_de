import 'package:ccvc_mobile/data/response/chi_tiet_lich_lam_viec/huy_lich_lam_viec_response.dart';
import 'package:ccvc_mobile/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
part 'cancel_lich_lam_viec_service.g.dart';

@RestApi()
abstract class CancelLichLamViecService {
  @factoryMethod
  factory CancelLichLamViecService(Dio dio, {String baseUrl}) = _CancelLichLamViecService;

  @GET(ApiConstants.CANCEL_TIET_LICH_LAM_VIEC)
  Future<CancelCalenderWorkResponse> cancelCalenderWork(@Path('id') String id);
}