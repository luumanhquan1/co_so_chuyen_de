import 'package:ccvc_mobile/data/response/chi_tiet_van_ban/chi_tiet_van_ban_di_response.dart';
import 'package:ccvc_mobile/utils/constants/api_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'chi_tiet_van_ban_di_service.g.dart';

@RestApi()
abstract class ChiTietVanBanDiService {
  @factoryMethod
  factory ChiTietVanBanDiService(Dio dio, {String baseUrl}) =
      _ChiTietVanBanDiService;

  @GET(ApiConstants.CHI_TIET_VAN_BAN_DI)
  Future<ChiTietVanBanDiDataResponse> getDataChiTietVanBanDi(
      @Path('id') String id);
}
