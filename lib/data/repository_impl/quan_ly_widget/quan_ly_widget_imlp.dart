import 'package:ccvc_mobile/data/response/quan_li_widget/quan_li_widget_response.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/data/services/quan_ly_widget/quan_ly_widget_service.dart';
import 'package:ccvc_mobile/domain/repository/quan_ly_widget/quan_li_widget_respository.dart';
import 'package:ccvc_mobile/home_module/domain/model/home/WidgetType.dart';

class QuanLyWidgetImlp implements QuanLyWidgetRepository {
  final QuanLyWidgetClient _quanLyWidgetClient;

  QuanLyWidgetImlp(this._quanLyWidgetClient);

  @override
  Future<Result<List<WidgetModel>>> getListWidget() {
    return runCatchingAsync<QuanLyWidgetResponse, List<WidgetModel>>(
        () => _quanLyWidgetClient.getListWidget(), (response) {
      return response.toDomain();
    });
  }
}
