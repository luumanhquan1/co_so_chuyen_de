import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/bao_chi_mang_xa_hoi/theo_doi_bai_viet/theo_doi_bai_viet_model.dart';
import 'package:ccvc_mobile/domain/repository/bao_chi_mang_xa_hoi/bao_chi_mang_xa_hoi_repository.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/thoi_doi_bai_viet/bloc/theo_doi_bai_viet_state.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:rxdart/rxdart.dart';

class TheoDoiBaiVietCubit extends BaseCubit<TheoDoiState> {
  TheoDoiBaiVietCubit() : super(TheoDoiStateInitial());

  final BehaviorSubject<TheoDoiBaiVietModel> _listBaiVietTheoDoi =
      BehaviorSubject<TheoDoiBaiVietModel>();

  Stream<TheoDoiBaiVietModel> get listBaiVietTheoDoi =>
      _listBaiVietTheoDoi.stream;

  int pageIndex=1;
  int totalPage=1;

  final String startDate = DateTime.now().formatApiSS;
  final String endDate = DateTime(
          DateTime.now().year,
          DateTime.now().month - 3,
          DateTime.now().day,
          DateTime.now().hour,
          DateTime.now().minute,
          DateTime.now().second,)
      .formatApiSS;

  final BaoChiMangXaHoiRepository _BCMXHRepo = Get.find();

  Future<void> getListBaiVietTheoDoi(
    String startDate,
    String enDate,
    int topic,
  ) async {
    showLoading();
    final result = await _BCMXHRepo.getBaiVietTheoDoi(
      pageIndex,
      10,
      startDate,
      enDate,
      topic,
    );
    result.when(
      success: (res) {
        totalPage=res.totalPages;
        _listBaiVietTheoDoi.sink.add(res);
      },
      error: (err) {
        return;
      },
    );
    showContent();
  }
}
