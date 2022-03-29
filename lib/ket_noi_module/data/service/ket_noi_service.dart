import 'dart:convert';

import 'package:ccvc_mobile/ket_noi_module/data/request/tao_su_kien_resquest.dart';
import 'package:ccvc_mobile/ket_noi_module/data/response/detail_chung_ket_noi_response.dart';
import 'package:ccvc_mobile/ket_noi_module/data/response/list_chung_ket_noi_response.dart';
import 'package:ccvc_mobile/ket_noi_module/data/response/loai_bai_viet_response.dart';
import 'package:ccvc_mobile/ket_noi_module/data/response/tao_su_kien_response.dart';
import 'package:ccvc_mobile/ket_noi_module/data/response/trong_nuoc_response.dart';
import 'package:ccvc_mobile/ket_noi_module/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'ket_noi_service.g.dart';

@RestApi()
abstract class KetNoiService {
  @factoryMethod
  factory KetNoiService(Dio dio, {String baseUrl}) = _KetNoiService;

  @GET(ApiConstants.KETNOI)
  @FormUrlEncoded()
  Future<ListChungKetNoiResponse> getListChungKetNoi(
    @Query('pageIndex') int pageIndex,
    @Query('pageSize') int pageSize,
    @Query('type') String type,
  );

  @GET(ApiConstants.KETNOI)
  @FormUrlEncoded()
  Future<ListChungKetNoiResponse> getListCategory(
    @Query('pageIndex') int pageIndex,
    @Query('pageSize') int pageSize,
    @Query('idDauMucSuKien') String idDauMucSuKien,
    @Query('type') String type,
  );

  @GET(ApiConstants.DETAIL_KETNOI)
  @FormUrlEncoded()
  Future<DetailKetNoiResponse> getDetailChungKetNoi(
    @Query('id') String id,
  );

  @GET(ApiConstants.LOAI_BAI_VIET)
  @FormUrlEncoded()
  Future<LoaiBaiVietResponse> getLoaiBaiViet(
    @Query('type') String type,
  );

  @POST(ApiConstants.TAO_SU_KIEN)
  @FormUrlEncoded()
  Future<TaoSuKienResponse> postTaoSuKien(
    @Part() TaoSuKienRequest taoSuKienRequest,
  );

  @GET(ApiConstants.TRONG_NUOC)
  @FormUrlEncoded()
  Future<TrongNuocResponse> getListTrongNuoc(
    @Query('pageIndex') int pageIndex,
    @Query('pageSize') int pageSize,
    @Query('category') String category,
    @Query('fullSize') bool fullSize,
  );
}
