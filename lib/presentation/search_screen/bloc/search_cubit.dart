import 'dart:developer';

import 'package:ccvc_mobile/home_module/domain/model/home/WidgetType.dart';
import 'package:ccvc_mobile/home_module/presentation/home_screen/bloc/home_cubit.dart';
import 'package:ccvc_mobile/presentation/menu_screen/ui/fake_date_menu.dart';



import 'package:rxdart/rxdart.dart';

class SearchCubit extends HomeCubit {
  SearchCubit() : super();
  BehaviorSubject<List<WidgetModel>> listWigdetSubject = BehaviorSubject();

  Stream<List<WidgetModel>> get listWigetStream => listWigdetSubject.stream;



  @override
  void getDataTongHopNhiemVu() {
    log("message");
  }
}

/// Get Config Widget
extension GetConfigWidget on SearchCubit {
  Future<void> configWidget() async {
    // listWigdetSubject.sink.add();
  }
}
