import 'package:ccvc_mobile/home_module/data/response/home/todo_current_user_response.dart';
import 'package:ccvc_mobile/tien_ich_module/data/request/to_do_list_request.dart';
import 'package:ccvc_mobile/tien_ich_module/data/response/list_nguoi_thuc_hien_response.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/nguoi_thuc_hien_model.dart';
import 'package:ccvc_mobile/tien_ich_module/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ccvc_mobile/tien_ich_module/data/response/topic_hdsd_response.dart';
import 'package:ccvc_mobile/tien_ich_module/data/response/danh_sach_hssd_response.dart';
import 'package:ccvc_mobile/tien_ich_module/data/response/detail_huong_dan_su_dung_response.dart';

part 'tien_ich_service.g.dart';

@RestApi()
abstract class TienIchService {
  @factoryMethod
  factory TienIchService(Dio dio, {String baseUrl}) = _TienIchService;

  @GET(ApiConstants.TOPIC_HDSD)
  Future<DataTopicHDSDResponse> getTopicHDSD();

  @GET(ApiConstants.TODO_LIST_CURRENT_USER)
  @FormUrlEncoded()
  Future<ToDoListResponse> getTodoList();

  @PUT(ApiConstants.TODO_LIST_UPDATE)
  @FormUrlEncoded()
  Future<ToDoListUpdateResponse> updateTodoList(
    @Body() ToDoListRequest toDoListRequest,
  );

  @POST(ApiConstants.TODO_LIST_CREATE)
  @FormUrlEncoded()
  Future<ToDoListUpdateResponse> createTodoList(
    @Body() CreateToDoRequest createToDoRequest,
  );

  @GET(ApiConstants.LIST_NGUOI_THUC_HIEN)
  Future<DataListNguoiThucHienResponse> getListNguoiThucHien(
    @Query('IsGetAll') bool isGetAll,
    @Query('PageSize') int pageSize,
    @Query('PageIndex') int pageIndex,
  );

  @GET(ApiConstants.GET_DANH_SACH_HDSD)
  Future<DataDanhSachHDSDResponse> getDanhSachHDSD(
    @Query('pageIndex') int pageIndex,
    @Query('pageSize') int pageSize,
    @Query('topicId') String topicId,
    @Query('type') String type,
    @Query('searchKeyword') String searchKeyword,
  );

  @GET(ApiConstants.GET_DETAIL_HUONG_DAN_SU_DUNG)
  Future<DataDetailHuongDanSuDungResponse> getDetailHuongDanSuDung(
    @Query('id') String id,
  );
}
