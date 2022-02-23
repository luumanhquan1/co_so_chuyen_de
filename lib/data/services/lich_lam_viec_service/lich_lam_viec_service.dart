import 'package:ccvc_mobile/data/request/lich_hop/category_list_request.dart';
import 'package:ccvc_mobile/data/request/lich_hop/nguoi_chu_tri_request.dart';
import 'package:ccvc_mobile/data/request/lich_lam_viec/danh_sach_lich_lam_viec_request.dart';
import 'package:ccvc_mobile/data/response/lich_hop/catogory_list_response.dart';
import 'package:ccvc_mobile/data/response/lich_hop/nguoi_chu_trinh_response.dart';
import 'package:ccvc_mobile/data/response/lich_lam_viec/danh_sach_lich_lam_viec_response.dart';
import 'package:ccvc_mobile/data/response/lich_lam_viec_dashbroad/lich_lam_viec_dashbroad_response.dart';
import 'package:ccvc_mobile/data/response/lich_lam_viec_dashbroad/lich_lam_viec_dashbroad_right_response.dart';
import 'package:ccvc_mobile/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'lich_lam_viec_service.g.dart';

@RestApi()
abstract class LichLamViecService {
  @factoryMethod
  factory LichLamViecService(Dio dio, {String baseUrl}) = _LichLamViecService;

  @GET(ApiConstants.LICH_LAM_VIEC_DASHBOARD)
  Future<LichLamViecDashBroadResponse> getLichLamViec(
    @Query('dateStart') String dateStart,
    @Query('dateTo') String dateTo,
  );

  @POST(ApiConstants.LICH_LAM_VIEC_DASHBOARD_RIGHT)
  Future<LichLamViecDashBroadRightResponse> getLichLamViecRight(
    @Query('dateStart') String dateStart,
    @Query('dateTo') String dateTo,
    @Query('type') int type,
  );

  @POST(ApiConstants.POST_DANH_SACH_LICH_LAM_VIEC)
  Future<DanhSachLichLamViecResponse> postData(
    @Body() DanhSachLichLamViecRequest bodyDanhSachLichLamViec,
  );

  @POST(ApiConstants.CATEGORY_LIST)
  Future<CatogoryListResponse> getLoaiLichLamViec(
    @Body() CatogoryListRequest catogoryListRequest,
  );

  @POST(ApiConstants.SEARCH_CAN_BO)
  Future<NguoiChuTriResponse> getNguoiChuTri(
      @Body() NguoiChuTriRequest nguoiChuTriRequest);

  @POST(ApiConstants.SCHEDULE_FIELD)
  Future<CatogoryListResponse> getLinhVuc(
      @Body() CatogoryListRequest catogoryListRequest);
}
