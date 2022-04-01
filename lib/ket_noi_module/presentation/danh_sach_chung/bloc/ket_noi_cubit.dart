import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/config/base/base_state.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/danh_sach_chung_model.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/loai_bai_viet_model.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/repository/ket_noi_repository.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/danh_sach_chung/bloc/ket_noi_state.dart';
import 'package:ccvc_mobile/utils/constants/api_constants.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class KetNoiCubit extends BaseCubit<BaseState> {
  KetNoiCubit() : super(KetNoiStateInitial());

  KetNoiRepository get repo => Get.find();
  LoaiBaiVietModel? dataCurrent;
  int pageIndex = 1;

  DataDanhSachChungModel dataDanhSachChungModel = DataDanhSachChungModel();

  BehaviorSubject<Object> menuSubject = BehaviorSubject();

  BehaviorSubject<DataDanhSachChungModel> dataDanhSachSubject =
      BehaviorSubject();

  Stream<DataDanhSachChungModel> get streamData => dataDanhSachSubject.stream;

  Future<void> getListChungKetNoi({
    required int pageIndex,
    required int pageSize,
  }) async {
    loadMorePage = pageIndex;
    final result = await repo.ketNoiListChung(pageIndex, pageSize, 'KET-NOI');
    result.when(
      success: (res) {
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

  //
  Future<void> getListCategory({
    required int page,
    required String category,
  }) async {
    if (page == ApiConstants.PAGE_BEGIN) {
      showLoading();
    }
    loadMorePage = page;
    final result = await repo.listCategory(
      page,
      ApiConstants.DEFAULT_PAGE_SIZE,
      category,
      'KET-NOI',
    );
    result.when(
      success: (res) {
        if (page == ApiConstants.PAGE_BEGIN) {
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

  //

  Future<void> getDataTrongNuoc(int page, String code) async {
    if (page == ApiConstants.PAGE_BEGIN) {
      showLoading();
    }
    loadMorePage = pageIndex;
    final result = await repo.getDataTrongNuoc(
      page,
      ApiConstants.DEFAULT_PAGE_SIZE,
      code,
      true,
    );
    result.when(
      success: (res) {
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
