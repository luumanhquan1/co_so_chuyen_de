import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/config/base/base_state.dart';
import 'package:ccvc_mobile/nhiem_vu_module/data/request/danh_sach_nhiem_vu_request.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/repository/nhiem_vu_repository.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/ui/mobile/bloc/danh_sach_state.dart';
import 'package:ccvc_mobile/nhiem_vu_module/utils/constants/api_constants.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:get/get.dart';

class DanhSachCubit extends BaseCubit<BaseState> {
  DanhSachCubit() : super(DanhSachStateInitial());

  NhiemVuRepository get repo => Get.find();
  int pageSize = 10;
  int pageIndex = 1;

  // void callApi() {
  //   postDanhSachNhiemVu(
  //     index: 1,
  //     isNhiemVuCaNhan: true,
  //     isSortByHanXuLy: true,
  //     mangTrangThai: [],
  //     ngayTaoNhiemVu: {'FromDate': '2021/04/01', 'ToDate': "2022/05/01"},
  //     size: 10,
  //   );
  // }

  Future<void> postDanhSachNhiemVu({
    required int index,
    required bool isNhiemVuCaNhan,
    required bool isSortByHanXuLy,
    required List<String> mangTrangThai,
    required Map<String, String> ngayTaoNhiemVu,
    required int size,
  }) async {
    final DanhSachNhiemVuRequest danhSachNhiemVuRequest =
        DanhSachNhiemVuRequest(
      index: index,
      isNhiemVuCaNhan: isNhiemVuCaNhan,
      isSortByHanXuLy: isSortByHanXuLy,
      mangTrangThai: mangTrangThai,
      ngayTaoNhiemVu: ngayTaoNhiemVu,
      size: size,
    );
    loadMorePage = pageIndex;
    final result = await repo.danhSachNhiemVu(danhSachNhiemVuRequest);
    result.when(
      success: (res) {
        print(res.pageData?.length ?? 0);
        if (pageIndex == ApiConstants.PAGE_BEGIN) {
          if (res.pageData?.isEmpty ?? true) {
            showEmpty();
          } else {
            showContent();
            emit(CompletedLoadMore(CompleteType.SUCCESS, posts: res.pageData));
          }
        } else {
          emit(CompletedLoadMore(CompleteType.SUCCESS, posts: res.pageData));
        }
      },
      error: (error) {
        emit(const CompletedLoadMore(CompleteType.ERROR));
        showError();
      },
    );
  }
}
