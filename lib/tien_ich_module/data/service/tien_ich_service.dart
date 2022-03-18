import 'package:ccvc_mobile/tien_ich_module/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ccvc_mobile/tien_ich_module/data/response/topic_hdsd_response.dart';
import 'package:ccvc_mobile/tien_ich_module/data/response/danh_sach_hssd_response.dart';
import 'package:ccvc_mobile/tien_ich_module/data/response/detail_huong_dan_su_dung_response.dart';
import 'package:ccvc_mobile/tien_ich_module/data/response/lich_am_duong_response.dart';

part 'tien_ich_service.g.dart';

@RestApi()
abstract class TienIchService {
  @factoryMethod
  factory TienIchService(Dio dio, {String baseUrl}) = _TienIchService;

  @GET(ApiConstants.TOPIC_HDSD)
  Future<DataTopicHDSDResponse> getTopicHDSD();

  @GET(ApiConstants.GET_DANH_SACH_HDSD)
  Future<DataDanhSachHDSDResponse> getDanhSachHDSD(
      @Query('pageIndex')     int pageIndex,
      @Query('pageSize')      int pageSize ,
      @Query('topicId')       String topicId,
      @Query('type')          String type,
      @Query('searchKeyword') String searchKeyword,
      );

  @GET(ApiConstants.GET_DETAIL_HUONG_DAN_SU_DUNG)
  Future<DataDetailHuongDanSuDungResponse> getDetailHuongDanSuDung(
    @Query('id') String id,
  );

  @GET(ApiConstants.GET_LICH_AM_DUONG)
  Future<DataLichAmDuongResponse> getLichAmDuong(
      @Query('dateStr') String date,
      );
}
