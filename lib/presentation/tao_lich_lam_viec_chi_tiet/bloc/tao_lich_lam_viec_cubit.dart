import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/presentation/tao_lich_lam_viec_chi_tiet/bloc/tao_lich_lam_viec_state.dart';
import 'package:ccvc_mobile/presentation/tao_lich_lam_viec_chi_tiet/ui/item_select_model.dart';
import 'package:rxdart/rxdart.dart';

class TaoLichLamViecCubit extends BaseCubit<TaoLichLamViecState> {
  TaoLichLamViecCubit() : super(TaoLichLVStateInitial());

  BehaviorSubject<List<ItemSelectModel>> listItemLoaiLichSubject =
      BehaviorSubject.seeded(listLoaiLich);
  BehaviorSubject<List<String>> listItemPersonSubject =
      BehaviorSubject.seeded(listPerson);

  BehaviorSubject<List<ItemSelectModel>> listTimeSubject =
      BehaviorSubject.seeded(listTime);

  BehaviorSubject<ItemSelectModel> timeSelectSubject =
      BehaviorSubject.seeded(listTime[3]);

  BehaviorSubject<List<ItemSelectModel>> listColorDefaultSubject =
      BehaviorSubject.seeded(listColorDefault);

  BehaviorSubject<List<ItemSelectModel>> listNguoiChuTriSubject =
      BehaviorSubject.seeded(listChuTri);

  BehaviorSubject<List<ItemSelectModel>> listLinhVucSubject =
      BehaviorSubject.seeded(listLinhVuc);

  Stream<List<ItemSelectModel>> get listLinhVucStream =>
      listLinhVucSubject.stream;

  Stream<List<ItemSelectModel>> get listChuTriStream =>
      listNguoiChuTriSubject.stream;

  Stream<List<ItemSelectModel>> get listColorDefaultStream =>
      listColorDefaultSubject.stream;

  Stream<ItemSelectModel> get timeSelectStream => timeSelectSubject.stream;

  Stream<List<ItemSelectModel>> get listTimeStream => listTimeSubject.stream;

  Stream<List<String>> get listItemPersonStream => listItemPersonSubject.stream;

  Stream<List<ItemSelectModel>> get listItemLoaiLichStream =>
      listItemLoaiLichSubject.stream;

  void selectLoaiLich(ItemSelectModel itemSelectModel) {
    listLoaiLich.forEach((element) {
      if (element == itemSelectModel) {
        element.isSelect = true;
      } else {
        element.isSelect = false;
      }
    });

    listItemLoaiLichSubject.add(listLoaiLich);
  }

  void selectNhacLai(ItemSelectModel time) {
    listTime.forEach((element) {
      if (time == element) {
        element.isSelect = true;
      } else {
        element.isSelect = false;
      }
    });

    listTimeSubject.add(listTime);
    timeSelectSubject.add(time);
  }

  void selectColor(ItemSelectModel color) {
    listColorDefault.forEach((element) {
      if (color == element) {
        element.isSelect = true;
      } else {
        element.isSelect = false;
      }
    });

    listColorDefaultSubject.add(listColorDefault);
  }

  void selectChuTri(ItemSelectModel chuTri) {
    listChuTri.forEach((element) {
      if (chuTri == element) {
        element.isSelect = true;
      } else {
        element.isSelect = false;
      }
    });

    listNguoiChuTriSubject.add(listChuTri);
  }

  void selectLinhVuc(ItemSelectModel chuTri) {
    listLinhVuc.forEach((element) {
      if (chuTri == element) {
        element.isSelect = true;
      } else {
        element.isSelect = false;
      }
    });

    listLinhVucSubject.add(listLinhVuc);
  }
}
