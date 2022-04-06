import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_cong_viec_nhiem_vu/chi_tiet_cong_viec_nhiem_vu_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/repository/nhiem_vu_repository.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/chi_tiet_cong_viec_nhiem_vu/bloc/chi_tiet_cong_viec_nhiem_vu_state.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:rxdart/rxdart.dart';

class ChiTietCongViecNhiemVuCubit
    extends BaseCubit<ChiTietCongViecNhiemVuState> {
  ChiTietCongViecNhiemVuCubit() : super(const ChiTietCongViecNhiemVuIntial());

  NhiemVuRepository get nhiemVuRepo => Get.find();

  BehaviorSubject<ChiTietCongViecNhiemVuModel> chiTietCongViecSubject =
      BehaviorSubject();

  Stream<ChiTietCongViecNhiemVuModel> get chiTietCongViecStream =>
      chiTietCongViecSubject.stream;

  Future<void> getChiTietCongViecNhiemVu(String congViecId) async {
    showLoading();
    final result = await nhiemVuRepo.getChiTietCongViec(congViecId);
    result.when(
      success: (res) {
        chiTietCongViecSubject.add(res);
        showContent();
      },
      error: (error) {},
    );
  }
}
