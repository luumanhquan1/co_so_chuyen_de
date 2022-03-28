import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/config/base/base_state.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/repository/tien_ich_repository.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/tra_cuu_van_ban_phap_luat/bloc/tra_cuu_van_ban_phap_luat_state.dart';
import 'package:ccvc_mobile/utils/constants/api_constants.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class TraCuuVanBanPhapLuatCubit extends BaseCubit<BaseState> {
  TraCuuVanBanPhapLuatCubit() : super(TraCuuVanBanPhapLuatStateIntial());

  TienIchRepository get traCuuVanBanPhapLuatRep => Get.find();

  String search = '';

  Future<void> getTraCuuVanBanPhapLuat(int page, int size) async {
    loadMorePage = page;
    final result = await traCuuVanBanPhapLuatRep.getTraCuuVanBanPhapLuat(
        search, page, size);
    result.when(
      success: (res) {
        if (page == ApiConstants.PAGE_BEGIN) {
          if (res.items?.isEmpty ?? true) {
            showEmpty();
          } else {
            showContent();
            emit(CompletedLoadMore(CompleteType.SUCCESS, posts: res.items));
          }
        } else {
          emit(CompletedLoadMore(CompleteType.SUCCESS, posts: res.items));
        }
      },
      error: (error) {
        emit(const CompletedLoadMore(CompleteType.ERROR));
        showError();
      },
    );
  }
}
