
import 'package:ccvc_mobile/domain/model/widget_manage/widget_model.dart';

class FakeData {
   static final List<WidgetModel> listUse =
   List.generate(10, (index) => WidgetModel(id: 'aa', name: "One ${index.toString()}"));

   static final List<WidgetModel> listNotUse=
   List.generate(10, (index) => WidgetModel(id: 'bb', name: "Two ${index.toString()}"));



}

