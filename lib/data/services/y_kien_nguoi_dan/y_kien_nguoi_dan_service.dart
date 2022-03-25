import 'package:ccvc_mobile/data/response/y_kien_nguoi_dan/dash_board_phan_loai_yknd_response.dart';
import 'package:ccvc_mobile/data/response/y_kien_nguoi_dan/dash_board_yknd_response.dart';
import 'package:ccvc_mobile/data/response/y_kien_nguoi_dan/thong_tin_y_kien_nguoi_dan_resopnse.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/thong_tin_y_kien_model.dart';
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
}
