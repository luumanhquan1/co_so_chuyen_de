import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tin_tuc_thoi_su_screen/ui/tin_tuc_thoi_su_screen.dart';
import 'package:rxdart/rxdart.dart';

class TinTucThoiSuBloc {
  BehaviorSubject<int> dropDownSubject = BehaviorSubject.seeded(1);

  Stream<int> get dropDownStream => dropDownSubject.stream;

  void changeItem(dropDown? nameDrop) {
    switch(nameDrop) {
      case dropDown.tinRadio: {
        dropDownSubject.add(1);
        break;
      }

      case dropDown.tinTrongNuoc : {
        dropDownSubject.add(2);
        break;
      }

      default: {
        dropDownSubject.add(1);
      }
    }
  }
}

