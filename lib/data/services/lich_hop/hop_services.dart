import 'dart:convert';

import 'package:ccvc_mobile/data/request/lich_hop/category_list_request.dart';
import 'package:ccvc_mobile/data/request/lich_hop/danh_sach_lich_hop_request.dart';
import 'package:ccvc_mobile/data/request/lich_hop/nguoi_chu_tri_request.dart';
import 'package:ccvc_mobile/data/request/lich_hop/tao_phien_hop_request.dart';
import 'package:ccvc_mobile/data/response/lich_hop/catogory_list_response.dart';
import 'package:ccvc_mobile/data/response/lich_hop/chi_tiet_lich_hop_response.dart';
import 'package:ccvc_mobile/data/response/lich_hop/chuong_trinh_hop_response.dart';
import 'package:ccvc_mobile/data/response/lich_hop/danh_sach_bieu_quyet_lich_hop_response.dart';
import 'package:ccvc_mobile/data/response/lich_hop/danh_sach_can_bo_response.dart';
import 'package:ccvc_mobile/data/response/lich_hop/danh_sach_lich_hop_response.dart';
import 'package:ccvc_mobile/data/response/lich_hop/danh_sach_phat_bieu_lich_hop_response.dart';
import 'package:ccvc_mobile/data/response/lich_hop/dash_board_lh_response.dart';
import 'package:ccvc_mobile/data/response/lich_hop/nguoi_chu_trinh_response.dart';
import 'package:ccvc_mobile/data/response/lich_hop/tao_phien_hop_response.dart';
import 'package:ccvc_mobile/data/response/lich_lam_viec/list_phien_hop_response.dart';
import 'package:ccvc_mobile/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'hop_services.g.dart';

@RestApi()
abstract class HopServices {
  @factoryMethod
  factory HopServices(Dio dio, {String baseUrl}) = _HopServices;

  @GET(ApiConstants.GET_DASH_BOARD_LH)
  Future<DashBoardLichHopResponse> getData(
    @Query('dateStart') String dateStart,
    @Query('dateTo') String dateTo,
  );

  @POST(ApiConstants.POST_DANH_SACH_LICH_HOP)
  Future<DanhSachLichHopResponse> postData(
    @Body() DanhSachLichHopRequest bodyDSLH,
  );

  @POST(ApiConstants.CATEGORY_LIST)
  Future<CatogoryListResponse> getLoaiHop(
    @Body() CatogoryListRequest catogoryListRequest,
  );

  @POST(ApiConstants.SCHEDULE_FIELD)
  Future<CatogoryListResponse> getLinhVuc(
      @Body() CatogoryListRequest catogoryListRequest);

  @POST(ApiConstants.SEARCH_CAN_BO)
  Future<NguoiChuTriResponse> getNguoiChuTri(
      @Body() NguoiChuTriRequest nguoiChuTriRequest);

  @GET(ApiConstants.DANH_SACH_CAN_BO_LICH_HOP)
  Future<DanhSachCanBoHopResponse> getDanhSachChuTri(@Query('id') String id);

  @GET(ApiConstants.DANH_SACH_PHIEN_HOP)
  Future<ListPhienHopRespone> getDanhSachPhienHop(@Query('id') String id);

  @GET(ApiConstants.DETAIL_MEETING_SCHEDULE)
  Future<ChiTietLichHopResponse> getChiTietLichHop(@Query('id') String id);

  @POST(ApiConstants.THEM_PHIEN_HOP_CHI_TIET)
  Future<TaoPhienHopResponse> getThemPhienHop(
    @Query('lichHopId') String lichHopId,
    @Part() TaoPhienHopRepuest taoPhienHopRepuest,
  );

  @GET(ApiConstants.CHUONG_TRINH_HOP)
  Future<ChuongTrinhHopResponse> getChuongTrinhHop(@Query('id') String id);

  @GET(ApiConstants.DANH_SACH_PHAT_BIEU_LICH_HOP)
  Future<DanhSachPhatBieuLichHopDataResponse> getDanhSachPhatBieuLichHop(
    @Query('lichHopId') String lichHopId,
  );

  @GET(ApiConstants.DANH_SACH_BIEU_QUYET_LICH_HOP)
  Future<DanhSachBieuQuyetLichHopDataResponse> getDanhSachBieuQuyetLichHop(
    @Query('id') String id,
  );
}
