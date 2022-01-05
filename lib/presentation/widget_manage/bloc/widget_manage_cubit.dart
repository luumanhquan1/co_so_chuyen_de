
import 'package:ccvc_mobile/domain/model/widget_manage/widget_model.dart';
import 'package:ccvc_mobile/presentation/widget_manage/fake_data.dart';
import 'package:rxdart/subjects.dart';

class WidgetManageCubit {
 final BehaviorSubject <List<WidgetModel>>_listWidgetUsing =
 BehaviorSubject<List<WidgetModel>>();
 final BehaviorSubject <List<WidgetModel>>_listWidgetNotUse=
 BehaviorSubject<List<WidgetModel>>();

 Stream<List<WidgetModel>> get listWidgetUsing => _listWidgetUsing.stream;
 Stream<List<WidgetModel>> get listWidgetNotUse => _listWidgetNotUse.stream;
 void _getListWidgetUsing() {
   _listWidgetUsing.sink.add(FakeData.listUse);
 }

 void _getListWidgetNotuse() {
   _listWidgetNotUse.sink.add(FakeData.listNotUse);
 }
void loadApi(){
  _getListWidgetUsing();
  _getListWidgetNotuse();
}
 void insertItemUsing(WidgetModel widgetItem,int index,){
   final List<WidgetModel>listItemWidgetUsing=_listWidgetUsing.value;
   final List<WidgetModel>listItemWidgetNotUse=_listWidgetNotUse.value;
   listItemWidgetUsing.insert(listItemWidgetUsing.length, widgetItem);
   listItemWidgetNotUse.removeAt(index);
   _listWidgetUsing.sink.add(listItemWidgetUsing);
   _listWidgetNotUse.sink.add(listItemWidgetNotUse);

 }

 void insertItemNotUse(WidgetModel widgetItem, int index,){
   final List<WidgetModel>listItemWidgetUsing=_listWidgetUsing.value;
   final List<WidgetModel>listItemWidgetNotUse=_listWidgetNotUse.value;
   listItemWidgetNotUse.insert(0, widgetItem);
   listItemWidgetUsing.removeAt(index);
   _listWidgetUsing.sink.add(listItemWidgetUsing);
   _listWidgetNotUse.sink.add(listItemWidgetNotUse);

 }
 void dispose() {
   _listWidgetUsing.close();
   _listWidgetNotUse.close();
 }
}


