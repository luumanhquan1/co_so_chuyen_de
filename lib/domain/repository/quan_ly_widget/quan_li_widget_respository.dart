

import 'package:ccvc_mobile/data/request/quan_li_widget/quan_ly_widget_request.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/home_module/domain/model/home/WidgetType.dart';
mixin QuanLyWidgetRepository {
  Future<Result<List<WidgetModel>>> getListWidget();

  Future<Result<List<WidgetModel>>> resetListWidget();

  Future<Result<List<WidgetModel>>> updateListWidget( QuanLyWidgetRequest widgetRequest);

}
