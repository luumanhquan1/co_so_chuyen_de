import 'package:ccvc_mobile/data/response/quan_ly_van_ban/vb_den_response.dart';
import 'package:ccvc_mobile/data/response/quan_ly_van_ban/vb_di_response.dart';
import 'package:ccvc_mobile/utils/constants/api_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'qlvb_service.g.dart';


@RestApi()
abstract class QuanLyVanBanClient {
  @factoryMethod
   factory QuanLyVanBanClient(Dio dio, {String baseUrl}) = _QuanLyVanBanClient;

  // @GET(ApiConstants.DASH_BOARD_VBDEN)
  // Future<VBDenResponse> getVbDen(@Field('NgayDauTien') String startDate,
  //     @Field('NgayCuoiCung') String endDate,);

  @GET(ApiConstants.DASH_BOARD_VBDi)
  Future<VBDiResponse> getVbDi(@Field('NgayDauTien') String startDate,
      @Field('NgayCuoiCung') String endDate,);
}
