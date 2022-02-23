import 'package:ccvc_mobile/data/request/hop/category_list_request.dart';
import 'package:ccvc_mobile/data/request/hop/nguoi_chu_tri_request.dart';
import 'package:ccvc_mobile/data/response/hop/catogory_list_response.dart';
import 'package:ccvc_mobile/data/response/hop/danh_sach_can_bo_response.dart';
import 'package:ccvc_mobile/data/response/hop/nguoi_chu_trinh_response.dart';
import 'package:ccvc_mobile/utils/constants/api_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'hop_service.g.dart';

@RestApi()
abstract class HopService {
  @factoryMethod
  factory HopService(Dio dio, {String baseUrl}) = _HopService;

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
}
