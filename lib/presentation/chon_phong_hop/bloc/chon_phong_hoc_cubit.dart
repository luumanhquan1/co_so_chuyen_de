import 'package:ccvc_mobile/presentation/chon_phong_hop/widgets/yeu_cau_them_thiet_bi_widget.dart';
import 'package:rxdart/rxdart.dart';

class ChonPhongHopCubit {
  final List<ThietBiValue> listThietBi = [];
  final BehaviorSubject<List<ThietBiValue>> _listThietBi =
      BehaviorSubject<List<ThietBiValue>>();

  Stream<List<ThietBiValue>> get listThietBiStream => _listThietBi.stream;

  void addThietBi(ThietBiValue value) {
    listThietBi.add(value);
    _listThietBi.sink.add(listThietBi);
  }

  void removeThietBi(ThietBiValue value) {}
  void dispose() {
    _listThietBi.close();
  }
}
