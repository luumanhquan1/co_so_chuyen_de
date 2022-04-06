import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/locals/hive_local.dart';
import 'package:ccvc_mobile/domain/model/account/data_user.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/y_kien_nguoi_dan_model.dart';
import 'package:ccvc_mobile/domain/repository/y_kien_nguoi_dan/y_kien_nguoi_dan_repository.dart';
import 'package:ccvc_mobile/presentation/y_kien_nguoi_dan/block/y_kien_nguoidan_state.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:rxdart/rxdart.dart';

class DanhSachYKienNguoiDanCubit extends BaseCubit<YKienNguoiDanState> {
  DanhSachYKienNguoiDanCubit() : super(YKienNguoiDanStateInitial());

  final BehaviorSubject<List<YKienNguoiDanModel>> _listYKienNguoiDan =
      BehaviorSubject<List<YKienNguoiDanModel>>();

  final BehaviorSubject<bool> _selectSreach = BehaviorSubject.seeded(false);

  Stream<List<YKienNguoiDanModel>> get listYKienNguoiDan =>
      _listYKienNguoiDan.stream;

  Stream<bool> get selectSreach => _selectSreach.stream;
  String donViId = '';
  String userId = '';

  void setSelectSearch() {
    _selectSreach.sink.add(!_selectSreach.value);
  }

  void callApi() {
    getUserData();
    getDanhSachYKienNguoiDan(
      '01/03/2022',
      '25/03/2022',
      10,
      1,
    );
  }

  final YKienNguoiDanRepository _YKNDRepo = Get.find();

  Future<void> getDanhSachYKienNguoiDan(
    String tuNgay,
    String denNgay,
    int pageSize,
    int pageNumber,
  ) async {
    showLoading();
    final result = await _YKNDRepo.danhSachYKienNguoiDan(
      tuNgay,
      denNgay,
      pageSize,
      pageNumber,
      userId,
      donViId,
    );
    showContent();
    result.when(
      success: (res) {
        _listYKienNguoiDan.sink.add(res.listYKienNguoiDan);
      },
      error: (err) {
        return;
      },
    );
  }

  Future<void> searchDanhSachYKienNguoiDan({
    required String tuNgay,
    required String denNgay,
    required int pageSize,
    required int pageNumber,
    required String tuKhoa,
  }) async {
    showLoading();
    final result = await _YKNDRepo.searchYKienNguoiDan(
      tuNgay,
      denNgay,
      pageSize,
      pageNumber,
      tuKhoa,
      userId,
      donViId,
    );
    showContent();
    result.when(
      success: (res) {
        _listYKienNguoiDan.sink.add(res.listYKienNguoiDan);
      },
      error: (err) {
        return;
      },
    );
  }

  void getUserData() {
    final DataUser? dataUser = HiveLocal.getDataUser();
    if (dataUser != null) {
      donViId = dataUser.userInformation?.donViTrucThuoc?.id ?? '';
      userId = dataUser.userId ?? '';
    }
  }

  void callSearchApi(
    String tuKhoa,
    String tuNgay,
    String denNgay,
    int pageSize,
    int pageNumber,
  ) {
    if (tuKhoa == '') {
      getDanhSachYKienNguoiDan(
        tuNgay,
        denNgay,
        pageSize,
        pageNumber,
      );
    } else {
      searchDanhSachYKienNguoiDan(
        tuNgay: tuNgay,
        denNgay: denNgay,
        pageSize: pageSize,
        pageNumber: pageNumber,
        tuKhoa: tuKhoa,
      );
    }
  }
}
