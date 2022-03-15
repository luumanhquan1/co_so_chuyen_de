import 'package:ccvc_mobile/domain/model/bao_chi_mang_xa_hoi/tin_tuc_thoi_su/tin_tuc_thoi_su_model.dart';
import 'package:ccvc_mobile/domain/repository/bao_chi_mang_xa_hoi/bao_chi_mang_xa_hoi_repository.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tin_tuc_thoi_su_screen/ui/tin_tuc_thoi_su_screen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:rxdart/rxdart.dart';

class TinTucThoiSuBloc {
  BehaviorSubject<int> dropDownSubject = BehaviorSubject.seeded(1);

  final BehaviorSubject<List<TinTucThoiSuModel>> _listTinTucThoiSu =
  BehaviorSubject<List<TinTucThoiSuModel>>();

  Stream<List<TinTucThoiSuModel>> get listTinTucThoiSu =>
      _listTinTucThoiSu.stream;


  Stream<int> get dropDownStream => dropDownSubject.stream;

  void changeItem(dropDown? nameDrop) {
    switch (nameDrop) {
      case dropDown.tinRadio:
        {
          dropDownSubject.add(1);
          break;
        }

      case dropDown.tinTrongNuoc :
        {
          dropDownSubject.add(2);
          break;
        }

      default:
        {
          dropDownSubject.add(1);
        }
    }
  }


  final BaoChiMangXaHoiRepository _BCMXHRepo = Get.find();

  Future<void> getListTinTucThoiSu(String startDate, String enDate) async {
    final result = await _BCMXHRepo.getTinTucThoiSu(
      1,
      30,
      startDate,
      enDate,
      918,
    );
    result.when(
      success: (res) {
        final result = res;
        // _listTinTucThoiSu.sink.add(result);
        print('--------------------------------- thanh cong----------------------');
      },
      error: (err) {
        print('---------------------------------that bai-------------------------');
        return;
      },
    );
  }
}
