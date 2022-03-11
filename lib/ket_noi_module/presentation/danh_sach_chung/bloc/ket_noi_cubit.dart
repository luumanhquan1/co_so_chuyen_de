import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/ket_noi_item_model.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/danh_sach_chung/bloc/ket_noi_state.dart';
import 'package:rxdart/rxdart.dart';

class KetNoiCubit extends BaseCubit<KetNoiState> {
  KetNoiCubit() : super(MainStateInitial());
  String textDay = '';
  BehaviorSubject<TypeKetNoiMenu> changeItemMenuSubject =
      BehaviorSubject.seeded(TypeKetNoiMenu.Chung);

  Stream<TypeKetNoiMenu> get streamTypeKetNoiMenu =>
      changeItemMenuSubject.stream;

  void changeScreenMenu(TypeKetNoiMenu typeMenu) {
    changeItemMenuSubject.add(typeMenu);
  }
}
