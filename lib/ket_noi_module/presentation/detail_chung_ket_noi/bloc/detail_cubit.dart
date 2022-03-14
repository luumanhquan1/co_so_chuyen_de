import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/detail_chung_model.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/repository/ket_noi_repository.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/detail_chung_ket_noi/bloc/detail_state.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class DetailCubit extends BaseCubit<DetailState> {
  DetailCubit() : super(MainStateInitial());

  KetNoiRepository get repo => Get.find();

  BehaviorSubject<DetailChungModel> subject = BehaviorSubject();
  DetailChungModel detailChungModel = DetailChungModel();

  Future<void> getDetailChungKetNoi({
    required String id,
  }) async {
    showLoading();
    final result = await repo.detailChungKetNoi(id);
    result.when(
      success: (res) {
        detailChungModel = res;
        subject.sink.add(detailChungModel);
        showContent();
      },
      error: (error) {
        showError();
      },
    );
  }
}
