import 'package:ccvc_mobile/config/app_config.dart';
import 'package:ccvc_mobile/domain/model/widget_manage/widget_model.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/home_screen.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/tablet/home_screen_tablet.dart';
import 'package:ccvc_mobile/presentation/widget_manage/fake_data.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:rxdart/subjects.dart';

class WidgetManageCubit {
  final BehaviorSubject<List<WidgetModel>> _listWidgetUsing =
      BehaviorSubject<List<WidgetModel>>();
  final BehaviorSubject<List<WidgetModel>> _listWidgetNotUse =
      BehaviorSubject<List<WidgetModel>>();
  final BehaviorSubject<List<WidgetModel>>_listUpdate=
  BehaviorSubject<List<WidgetModel>>();

  Stream<List<WidgetModel>> get listWidgetUsing => _listWidgetUsing.stream;

  Stream<List<WidgetModel>> get listWidgetNotUse => _listWidgetNotUse.stream;

  Stream<List<WidgetModel>> get listUpdate => _listUpdate.stream;


  void _getListWidgetUsing() {
    _listWidgetUsing.sink.add(FakeData.listUse);
  }

  void _getListWidgetNotuse() {
    _listWidgetNotUse.sink.add(FakeData.listNotUse);
  }

  void loadApi() {
    _getListWidgetUsing();
    _getListWidgetNotuse();
  }

  void insertItemUsing(
    WidgetModel widgetItem,
    int index,
  ) {
    final List<WidgetModel> listItemWidgetUsing = _listWidgetUsing.value;
    final List<WidgetModel> listItemWidgetNotUse = _listWidgetNotUse.value;
    listItemWidgetUsing.insert(listItemWidgetUsing.length, widgetItem);
    listItemWidgetNotUse.removeAt(index);
    orderWidgetHome(listItemWidgetUsing);
    _listWidgetUsing.sink.add(listItemWidgetUsing);
    _listWidgetNotUse.sink.add(listItemWidgetNotUse);
  }

  void insertItemNotUse(
    WidgetModel widgetItem,
    int index,
  ) {
    final List<WidgetModel> listItemWidgetUsing = _listWidgetUsing.value;
    final List<WidgetModel> listItemWidgetNotUse = _listWidgetNotUse.value;
    listItemWidgetNotUse.insert(0, widgetItem);
    listItemWidgetUsing.removeAt(index);
    _listWidgetUsing.sink.add(listItemWidgetUsing);
    orderWidgetHome(listItemWidgetUsing);
    _listWidgetNotUse.sink.add(listItemWidgetNotUse);
  }

  void dispose() {
    _listWidgetUsing.close();
    _listWidgetNotUse.close();
  }

  void sortListWidget(
    int oldIndex,
    int newIndex,
  ) {

    final List<WidgetModel> listUpdate = _listWidgetUsing.value;
    final element=listUpdate.removeAt(oldIndex);
    listUpdate.insert(newIndex, element);
    if(APP_DEVICE==DeviceType.TABLET){
      keyHomeTablet.currentState?.homeCubit.orderWidget(listUpdate);
    }else{
      keyHomeMobile.currentState?.homeCubit.orderWidget(listUpdate);
    }
    _listUpdate.sink.add(listUpdate);
  }
  void orderWidgetHome(List<WidgetModel> listUpdate){
    if(APP_DEVICE==DeviceType.TABLET){
      keyHomeTablet.currentState?.homeCubit.orderWidget(listUpdate);
    }else{
      keyHomeMobile.currentState?.homeCubit.orderWidget(listUpdate);
    }
  }
}
