import 'package:ccvc_mobile/nhiem_vu_module/data/response/chi_tiet_nhiem_vu_response.dart';
import 'package:ccvc_mobile/nhiem_vu_module/data/response/lich_su_phan_xu_ly_nhiem_vu_response.dart';
import 'package:ccvc_mobile/nhiem_vu_module/data/response/y_kien_su_ly_nhiem_vu_response.dart';
import 'package:ccvc_mobile/nhiem_vu_module/data/response/danh_sach_cong_viec_chi_tiet_nhiem_vu_response.dart';
import 'package:ccvc_mobile/nhiem_vu_module/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'nhiem_vu_service.g.dart';

@RestApi()
abstract class NhiemVuService {
  @factoryMethod
  factory NhiemVuService(Dio dio, {String baseUrl}) = _NhiemVuService;

  @GET(ApiConstants.GET_CHI_TIET_NHIEM_VU)
  Future<DataChiTietNhiemVuResponse> getChiTietNhiemVu(
    @Query('nhiemVuId') String nhiemVuId,
    @Query('isCaNhan') bool isCaNhan,
  );

  @GET(ApiConstants.GET_LICH_SU_PHAN_XU_LY_NHIEM_VU)
  Future<DataLichSuPhanXuLyNhiemVuModelResponse> getLichSuPhanXuLy(
    @Query('nhiemVuId') String nhiemVuId,
  );

  @GET(ApiConstants.GET_Y_KIEN_XU_LY)
  Future<DataYKienXuLyFileDinhKemResponse> getYKienXuLyNhiemVu(
    @Path('id') String nhiemVuId,
  );

  @GET(ApiConstants.GET_DANH_SACH_CONG_VIEC_CHI_TIET_NHIEM_VU)
  Future<DataDanhSachCongViecChiTietNhiemVuModelResponse> getDanhSachCongViecChiTietNhiemVu(
    @Query('nhiemVuId') String nhiemVuId,
      @Query('isCaNhan') bool isCaNhan,
  );
}
