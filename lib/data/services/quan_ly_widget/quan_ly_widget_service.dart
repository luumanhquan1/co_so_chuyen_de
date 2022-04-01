
import 'package:ccvc_mobile/data/response/quan_li_widget/quan_li_widget_response.dart';
import 'package:ccvc_mobile/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'quan_ly_widget_service.g.dart';

@RestApi()
abstract class QuanLyWidgetClient {
  @factoryMethod
  factory QuanLyWidgetClient(Dio dio, {String baseUrl}) = _QuanLyWidgetClient;

  @GET(ApiConstants.GET_LIST_WIDGET)
  Future<QuanLyWidgetResponse> getListWidget();
}
