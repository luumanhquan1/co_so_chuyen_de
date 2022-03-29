import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/config/base/base_state.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/danh_sach_chung_model.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/repository/ket_noi_repository.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/danh_sach_chung/bloc/ket_noi_state.dart';
import 'package:ccvc_mobile/utils/constants/api_constants.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class KetNoiCubit extends BaseCubit<BaseState> {
  KetNoiCubit() : super(KetNoiStateInitial());

  KetNoiRepository get repo => Get.find();
  String sukien = '';
  String idDauMucSuKien = '';
  String textDay = '';
  int pageSize = 10;
  int pageIndex = 1;
  String type = 'KET-NOI';
  String subCategory = '';

  DataDanhSachChungModel dataDanhSachChungModel = DataDanhSachChungModel();

  BehaviorSubject<String> headerSubject = BehaviorSubject();
  BehaviorSubject<Object> menuSubject = BehaviorSubject();
  Stream<String> get streamHeader => headerSubject.stream;

  BehaviorSubject<DataDanhSachChungModel> dataDanhSachSubject =
      BehaviorSubject();

  Stream<DataDanhSachChungModel> get streamData => dataDanhSachSubject.stream;

  Future<void> getListChungKetNoi({
    required int pageIndex,
    required int pageSize,
    required String type,
  }) async {
    loadMorePage = pageIndex;
    final result = await repo.ketNoiListChung(pageIndex, pageSize, type);
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
    required int pageIndex,
    required int pageSize,
    required String idDauMucSuKien,
    required String type,
  }) async {
    loadMorePage = pageIndex;
    final result = await repo.listCategory(
      pageIndex,
      pageSize,
      idDauMucSuKien,
      type,
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

  //

  Future<void> getDataTrongNuoc(int page, String idDauMucSuKiens) async {
    loadMorePage = pageIndex;
    final result = await repo.getDataTrongNuoc(
      page,
      1,
      idDauMucSuKiens,
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

  String getSubCategory(String title) {
    switch (title) {
      case 'Các cơ quan khác':
        return 'CAC_CQ_KHAC';
      case 'Chính phủ':
        return 'CHINH_PHU';
      case 'Các tổ chức':
        return 'CAC_TO_CHUC';
      case 'Các đơn vị hành chính':
        return 'CAC_DON_VI_HANH_CHINH';
      default:
        return 'CAC_CQ_KHAC';
    }
  }
}
