import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/y_kien_model.dart';
import 'package:ccvc_mobile/presentation/lichlv_danh_sach_y_kien/bloc/y_kien_state.dart';
import 'package:rxdart/rxdart.dart';

class YKienCubit extends BaseCubit<YKienState> {
  YKienCubit(YKienState initialState) : super(initialState);
  final BehaviorSubject<List<YKienModel>>_listYKien =
      BehaviorSubject<List<YKienModel>>();
  Stream<List<YKienModel>> get listYKien => _listYKien.stream;

  void fakeData(){
    _listYKien.sink.add(listDataFake);
  }


  List<YKienModel>listDataFake=[
    YKienModel(time: '01/01/2022', fileName: 'file', imgAvatar: '', name: 'Le Si Lam'),
    YKienModel(time: '01/01/2022', fileName: 'file', imgAvatar: '', name: 'Le Si Lam'),
    YKienModel(time: '01/01/2022', fileName: 'file', imgAvatar: '', name: 'Le Si Lam'),
    YKienModel(time: '01/01/2022', fileName: 'file', imgAvatar: '', name: 'Le Si Lam'),
    YKienModel(time: '01/01/2022', fileName: 'file', imgAvatar: '', name: 'Le Si Lam'),
    YKienModel(time: '01/01/2022', fileName: 'file', imgAvatar: '', name: 'Le Si Lam'),
  ];

}
