import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/loai_bai_viet_model.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/repository/ket_noi_repository.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/tao_su_kien/bloc/tao_su_kien_state.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class TaoSuKienCubit extends BaseCubit<TaoSuKienState> {
  TaoSuKienCubit() : super(MainStateInitial());

  KetNoiRepository get repo => Get.find();

  BehaviorSubject<List<String>> loaiBaiVietSubject =
      BehaviorSubject.seeded(['', '', '']);
  List<LoaiBaiVietModel> listData = [];
  LoaiBaiVietModel loaiBaiVietModel = LoaiBaiVietModel();
  String type = 'KET-NOI';

  void callApi() {
    getLoaiBaiViet(type: type);
  }

  List<String> listName = [];

  Future<void> getLoaiBaiViet({
    required String type,
  }) async {
    showLoading();
    final result = await repo.loaiBaiViet(type);
    result.when(
      success: (res) {
        listData = res;
        for (final i in listData) {
          for (final j in i.childrens ?? []) {
            listName.add(j.title);
          }
        }
        loaiBaiVietSubject.sink.add(listName);
        showContent();
      },
      error: (error) {
        showError();
      },
    );
  }
}
