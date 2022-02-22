import 'package:ccvc_mobile/data/request/list_lich_lv/list_lich_lv_request.dart';
import 'package:ccvc_mobile/data/response/list_lich_lv/list_lich_lv_response.dart';
import 'package:ccvc_mobile/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'list_lich_lv_service.g.dart';

@RestApi()
abstract class ListLichLvService {
  @factoryMethod
  factory ListLichLvService(Dio dio, {String baseUrl}) = _ListLichLvService;

  @POST(ApiConstants.LIST_LICH_LV)
  Future<ListLichLvResponse> getListLichLv(
    @Body() ListLichLvRequest lichLvRequest,
  );
}
