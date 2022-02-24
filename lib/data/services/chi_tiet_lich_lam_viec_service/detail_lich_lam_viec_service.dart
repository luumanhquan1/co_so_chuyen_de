import 'package:ccvc_mobile/data/response/chi_tiet_lich_lam_viec/chi_tiet_lich_lam_viec.dart';
import 'package:ccvc_mobile/utils/constants/api_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'detail_lich_lam_viec_service.g.dart';

@RestApi()
abstract class DetailLichLamViecService {
  @factoryMethod
  factory DetailLichLamViecService(Dio dio, {String baseUrl}) =
      _DetailLichLamViecService;

  @GET(ApiConstants.CHI_TIET_LICH_LAM_VIEC)
  Future<DetailCalenderWorkResponse> detailCalenderWork(@Path('id') String id);
}
