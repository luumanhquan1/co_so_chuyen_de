import 'package:ccvc_mobile/domain/repository/thanh_phan_tham_gia_reponsitory.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/ui/mobile/tree/model/danh_sach_model.dart';
import 'package:get/get.dart' as GET_IT;
import 'package:rxdart/rxdart.dart';

class DanhBaCubitTree {
  final List<DanhSachModel> listPeople = [];

  ThanhPhanThamGiaReponsitory get hopRp => GET_IT.Get.find();
  final BehaviorSubject<List<DanhSachModel>> _listPeopleThamGia =
      BehaviorSubject<List<DanhSachModel>>();

  Stream<List<DanhSachModel>> get listPeopleThamGia =>
      _listPeopleThamGia.stream;

  final BehaviorSubject<List<Node<DanhSachModel>>> _getTreeDanhSach =
      BehaviorSubject<List<Node<DanhSachModel>>>();

  Stream<List<Node<DanhSachModel>>> get getTreeDonVi => _getTreeDanhSach.stream;

  void addPeopleThamGia(
    List<DanhSachModel> danhSachModel,
  ) {
    for (final vl in danhSachModel) {
      if (listPeople.indexWhere((element) => element.id == vl.id) == -1) {
        listPeople.add(vl);
      }
    }
    _listPeopleThamGia.sink.add(listPeople);
  }

  void getTree() {
    hopRp.getTreeDonVi().then((value) {
      value.when(
        success: (res) {
          // _getTreeDanhSach.sink.add(res);
        },
        error: (err) {},
      );
    });
  }

  void nhapNoiDungDonVi(String text, DanhSachModel donViModel) {
    donViModel.noidung = text.trim();
  }

  void deletePeopleThamGia(DanhSachModel donViModel) {
    listPeople.remove(donViModel);

    _listPeopleThamGia.sink.add(listPeople);
  }

  void dispose() {
    _listPeopleThamGia.close();
    _getTreeDanhSach.close();
  }
}
