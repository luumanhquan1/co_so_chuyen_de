import 'dart:developer';
import 'package:ccvc_mobile/domain/model/widget_manage/widget_model.dart';
import 'package:ccvc_mobile/presentation/home_screen/bloc/home_cubit.dart';
import 'package:ccvc_mobile/presentation/home_screen/fake_data.dart';
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
    listWigdetSubject.sink.add(FakeData.listSearchWidget);
  }
}
