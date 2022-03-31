import 'package:ccvc_mobile/data/request/y_kien_nguoi_dan/chi_tiet_kien_nghi_request.dart';
import 'package:ccvc_mobile/data/request/y_kien_nguoi_dan/danh_sach_y_kien_pakn_request.dart';
import 'package:ccvc_mobile/data/response/y_kien_nguoi_dan/chi_tiet_kien_nghi_respnse.dart';
import 'package:ccvc_mobile/data/response/y_kien_nguoi_dan/danh_sach_ket_qua_y_kien_xu_ly_response.dart';
import 'package:ccvc_mobile/data/response/y_kien_nguoi_dan/danh_sach_y_kien_nguoi_dan_response.dart';
import 'package:ccvc_mobile/data/response/y_kien_nguoi_dan/dash_board_phan_loai_yknd_response.dart';
import 'package:ccvc_mobile/data/response/y_kien_nguoi_dan/dash_board_yknd_response.dart';
import 'package:ccvc_mobile/data/response/y_kien_nguoi_dan/search_y_kien_nguoi_dan_response.dart';
import 'package:ccvc_mobile/data/response/y_kien_nguoi_dan/thong_tin_y_kien_nguoi_dan_resopnse.dart';
import 'package:ccvc_mobile/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'y_kien_nguoi_dan_service.g.dart';

@RestApi()
abstract class YKienNguoiDanService {
  @factoryMethod
  factory YKienNguoiDanService(Dio dio, {String baseUrl}) =
      _YKienNguoiDanService;

  @GET(ApiConstants.DASH_BOARD_TINH_HINH_XU_LY)
  Future<DashBoashTinhHinhXuLyResponse> getDashBoardTinhHinhXuLy(
    @Query('donViId') String donViId,
    @Query('TuNgay') String TuNgay,
    @Query('DenNgay') String DenNgay,
  );

  @GET(ApiConstants.DASH_BOARD_PHAN_LOAI)
  Future<DashBoashPhanLoaiResponse> getDashBoardPhanLoai(
    @Query('donViId') String donViId,
    @Query('TuNgay') String TuNgay,
    @Query('DenNgay') String DenNgay,
  );

  @GET(ApiConstants.THONG_TIN_Y_KIEN_NGUOI_DAN)
  Future<ThongTinYKienNguoiDanResponse> getThongTinYKienNguoiDan(
    @Query('donViId') String donViId,
    @Query('TuNgay') String TuNgay,
    @Query('DenNgay') String DenNgay,
  );

  @GET(ApiConstants.DANH_SACH_Y_KIEN_NGUOI_DAN)
  Future<DanhSachYKienNguoiDanResponse> getDanhSachYKienNguoiDan(
    @Query('TuNgay') String tuNgay,
    @Query('DenNgay') String denNgay,
    @Query('PageSize') int pageSize,
    @Query('PageNumber') int pageNumber,
    @Query('userId') String userId,
    @Query('donViId') String donViId,
  );

  @POST(ApiConstants.CHI_TIET_Y_KIEN_NGUOI_DAN)
  Future<ChiTietKienNghiResponse> chiTietYKienNguoiDan(
     @Body() ChiTietKienNghiRequest chiTietKienNghiRequest,
  );
  @GET(ApiConstants.SEARCH_Y_KIEN_NGUOI_DAN)
  Future<SearchYKienNguoiDanResponse> searchDanhSachYKienNguoiDan(
      @Query('TuNgay') String tuNgay,
      @Query('DenNgay') String denNgay,
      @Query('PageSize') int pageSize,
      @Query('PageNumber') int pageNumber,
      @Query('TuKhoa') String tuKhoa,
      @Query('userId') String userId,
      @Query('donViId') String donViId,
      );
  @POST(ApiConstants.GET_DANH_SACH_Y_KIEN_PAKN)
  Future<DanhSachKetQuaYKXLModelResponse> getDanhSachYKienPAKN(
      @Body() DanhSachYKienPAKNRequest danhSachYKienPAKNRequest,
      );
}
