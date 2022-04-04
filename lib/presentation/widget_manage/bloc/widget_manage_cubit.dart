import 'dart:convert';

import 'package:ccvc_mobile/config/app_config.dart';
import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/data/request/quan_li_widget/quan_ly_widget_request.dart';
import 'package:ccvc_mobile/domain/repository/quan_ly_widget/quan_li_widget_respository.dart';
import 'package:ccvc_mobile/home_module/presentation/home_screen/ui/mobile/home_screen.dart';
import 'package:ccvc_mobile/home_module/presentation/home_screen/ui/tablet/home_screen_tablet.dart';
import 'package:ccvc_mobile/presentation/widget_manage/bloc/widget_manage__state.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:rxdart/subjects.dart';

import '/home_module/domain/model/home/WidgetType.dart';

class WidgetManageCubit extends BaseCubit<WidgetManageState> {
  final BehaviorSubject<List<WidgetModel>> _listWidgetUsing =
      BehaviorSubject<List<WidgetModel>>();
  final BehaviorSubject<List<WidgetModel>> _listWidgetNotUse =
      BehaviorSubject<List<WidgetModel>>();
  final BehaviorSubject<List<WidgetModel>> _listUpdate =
      BehaviorSubject<List<WidgetModel>>();

  WidgetManageCubit() : super(WidgetManagerStateInitial());

  Stream<List<WidgetModel>> get listWidgetUsing => _listWidgetUsing.stream;

  Stream<List<WidgetModel>> get listWidgetNotUse => _listWidgetNotUse.stream;

  Stream<List<WidgetModel>> get listUpdate => _listUpdate.stream;
  List<WidgetModel> listUsing = [];
  List<WidgetModel> listNotUse = [];
  List<String> listTitleWidgetUse = [];
  final List<String> removeWidget = [
    WidgetTypeConstant.HANH_CHINH_CONG,
    WidgetTypeConstant.LICH_LAM_VIEC_LICH_HOP,
    WidgetTypeConstant.TONG_HOP_HCC,
  ];

  void _getListWidgetUsing() {
    if (APP_DEVICE == DeviceType.TABLET) {
      listUsing = keyHomeTablet.currentState?.homeCubit.getListWidget ?? [];
    } else {
      listUsing = keyHomeMobile.currentState?.homeCubit.getListWidget ?? [];
    }
    listTitleWidgetUse = listUsing.map((e) => e.name).toList();
    _listWidgetUsing.sink.add(listUsing);
  }

  void loadApi() {
    _getListWidgetUsing();
    _getListWidgetNotUse();
    updateListWidget('');
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
    final element = listUpdate.removeAt(oldIndex);
    listUpdate.insert(newIndex, element);
    if (APP_DEVICE == DeviceType.TABLET) {
      keyHomeTablet.currentState?.homeCubit.orderWidget(listUpdate);
    } else {
      keyHomeMobile.currentState?.homeCubit.orderWidget(listUpdate);
    }
    _listUpdate.sink.add(listUpdate);
  }

  void orderWidgetHome(List<WidgetModel> listUpdate) {
    if (APP_DEVICE == DeviceType.TABLET) {
      keyHomeTablet.currentState?.homeCubit.orderWidget(listUpdate);
    } else {
      keyHomeMobile.currentState?.homeCubit.orderWidget(listUpdate);
    }
  }

  final QuanLyWidgetRepository _qlWidgetRepo = Get.find();

  Future<void> _getListWidgetNotUse() async {
    showLoading();
    final result = await _qlWidgetRepo.getListWidget();
    result.when(
      success: (res) {
        for (final element in res) {
          // ignore: iterable_contains_unrelated_type
          if (!listTitleWidgetUse.contains(element.name) &&
              !removeWidget.contains(element.component)) {
            listNotUse.add(element);
          }
        }
        _listWidgetNotUse.sink.add(listNotUse);
        showContent();
      },
      error: (err) {
        return;
      },
    );
  }

  Future<void> resetListWidget() async {
    showLoading();
    final result = await _qlWidgetRepo.resetListWidget();
    result.when(
      success: (res) {
        listUsing.clear();
        listNotUse.clear();
        listUsing = res;
        listTitleWidgetUse = listUsing.map((e) => e.name).toList();
        for (final element in res) {
          // ignore: iterable_contains_unrelated_type
          if (!listTitleWidgetUse.contains(element.name) &&
              !removeWidget.contains(element.component)) {
            listNotUse.add(element);
          }
        }
        _listWidgetUsing.sink.add(listUsing);
        _listWidgetNotUse.sink.add(listNotUse);
        showContent();
      },
      error: (err) {
        return;
      },
    );
  }

  Future<void> updateListWidget(String request) async {
    final QuanLyWidgetRequest request= QuanLyWidgetRequest(widgetConfigData:'[{\"id\":\"cc91c734-d60e-470f-a380-4612b617f084\",\"name\":\"Sự kiện trong ngày\",\"widgetTypeId\":\"8fe7339c-728f-4a44-824e-5a57c9c4c54d\",\"description\":\"Danh sách sự kiện trong ngày\",\"code\":\"CODE\",\"width\":4,\"height\":9,\"minWidth\":3,\"minHeight\":6,\"maxHeight\":99,\"maxWidth\":12,\"props\":{},\"component\":\"SuKienTrongNgay\",\"static\":false,\"isResizable\":true,\"thumbnail\":\"su-kien-trong-ngay.png\",\"appId\":null,\"order\":3,\"isShowing\":true,\"x\":0,\"y\":0,\"i\":3,\"enable\":true,\"moved\":false,\"w\":4,\"h\":9,\"maxH\":99,\"maxW\":12,\"minH\":6,\"minW\":3},{\"id\":\"8874b642-0387-4391-a2c7-4843f4324887\",\"name\":\"Văn bản\",\"widgetTypeId\":\"8fe7339c-728f-4a44-824e-5a57c9c4c54d\",\"description\":null,\"code\":\"CODE\",\"width\":4,\"height\":9,\"minWidth\":3,\"minHeight\":6,\"maxHeight\":9,\"maxWidth\":12,\"props\":{},\"component\":\"VanBanWidGet\",\"static\":false,\"isResizable\":true,\"thumbnail\":\"lich-hop.png\",\"appId\":\"42786a27-556d-4eb0-bbd7-30088ba06077\",\"order\":2,\"isShowing\":true,\"x\":4,\"y\":0,\"i\":1,\"enable\":true,\"moved\":false,\"w\":4,\"h\":9,\"maxH\":9,\"maxW\":12,\"minH\":6,\"minW\":3},{\"id\":\"fc348f83-1a6c-4c9e-90df-5e4d1aa31879\",\"name\":\"Tình hình xử lý văn bản\",\"widgetTypeId\":\"8fe7339c-728f-4a44-824e-5a57c9c4c54d\",\"description\":null,\"code\":\"CODE\",\"width\":4,\"height\":9,\"minWidth\":4,\"minHeight\":6,\"maxHeight\":9,\"maxWidth\":8,\"props\":{},\"component\":\"TinhHinhXuLyVanBan\",\"static\":false,\"isResizable\":true,\"thumbnail\":\"lich-hop.png\",\"appId\":\"42786a27-556d-4eb0-bbd7-30088ba06077\",\"order\":1,\"isShowing\":true,\"x\":8,\"y\":0,\"i\":2,\"enable\":true,\"moved\":false,\"w\":4,\"h\":9,\"maxH\":9,\"maxW\":8,\"minH\":6,\"minW\":4}]',
    );
    for (final element in listUsing) {
      jsonEncode(element);
    }
    showLoading();
    final result = await _qlWidgetRepo.updateListWidget(request);
    result.when(
      success: (res) {
        showContent();
      },
      error: (err) {

        return;
      },
    );
  }
}
