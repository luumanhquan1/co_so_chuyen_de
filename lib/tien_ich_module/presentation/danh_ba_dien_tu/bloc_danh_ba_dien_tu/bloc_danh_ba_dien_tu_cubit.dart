import 'dart:io';

import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/config/base/base_state.dart';
import 'package:ccvc_mobile/tien_ich_module/data/request/sua_danh_sach_request.dart';
import 'package:ccvc_mobile/tien_ich_module/data/request/them_danh_ba_ca_nhan_request.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/danh_ba_dien_tu.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/repository/danh_ba_dien_tu_repository.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/bloc_danh_ba_dien_tu/bloc_danh_ba_dien_tu_state.dart';
import 'package:ccvc_mobile/tien_ich_module/utils/extensions/date_time_extension.dart';
import 'package:ccvc_mobile/utils/constants/api_constants.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class DanhBaDienTuCubit extends BaseCubit<BaseState> {
  DanhBaDienTuCubit() : super(DanhBaDienTuStateInitial());

  DanhBaDienTuRepository get tienIchRep => Get.find();
  int page = 1;
  int totalPage = 1;
  int pageSize = 10;
  int pageIndex = 1;
  String createdAt = DateTime.now().formatApiDanhBa;
  String updatedAt = DateTime.now().formatApiDanhBa;
  String hoTen = '';
  String phoneDiDong = '';
  String phoneCoQuan = '';
  String phoneNhaRieng = '';
  String email = '';
  bool gioiTinh = true;
  String ngaySinh = '';
  String cmtnd = '';
  String anhDaiDienFilePath = '';
  String anhChuKyFilePath = '';
  String anhChuKyNhayFilePath = '';
  String diaChi = '';
  bool isDeleted = false;
  int? thuTu = 0;
  List<String>? groupIds = [];
  String id = '';
  String search = '';
  BehaviorSubject<File> saveFile = BehaviorSubject();
  final BehaviorSubject<String> anhDanhBaCaNhan = BehaviorSubject();

  String subString(String? name) {
    if (name != null) {
      return name.substring(0, 1);
    }
    return '';
  }

  String subStringFix(String name) {
    if (name.trim().isNotEmpty) {
      return name.substring(0, 1);
    }
    return '';
  }

  void callApiDanhSach() {
    getListDanhBaCaNhan(pageIndex: pageIndex, pageSize: pageSize);
  }

  void callApiDanhBaToChuc() {
    getListDanhBaToChuc(
      pageIndex: pageIndex,
      pageSize: pageSize,
      filterBy: search,
      idDonVi: id,
    );
  }

  void searchListDanhSach(String keyword) {
    searchListDanhBaCaNhan(
      pageIndex: pageIndex,
      pageSize: pageSize,
      keyword: keyword,
    );
  }

  void callApi() {
    postDanhSach(
      hoTen: hoTen,
      phoneDiDong: phoneDiDong,
      phoneCoQuan: phoneCoQuan,
      phoneNhaRieng: phoneNhaRieng,
      email: email,
      gioiTinh: gioiTinh,
      ngaySinh: ngaySinh,
      cmtnd: cmtnd,
      anhDaiDienFilePath: anhDaiDienFilePath,
      anhChuKyFilePath: anhChuKyFilePath,
      anhChuKyNhayFilePath: anhChuKyNhayFilePath,
      diaChi: diaChi,
      isDeleted: isDeleted,
      thuTu: thuTu ?? 0,
      groupIds: groupIds ?? [],
    );
  }

  void suaDanhSachApi(String id) {
    suaDanhSach(
      groups: '',
      hoTen: hoTen,
      phoneDiDong: phoneDiDong,
      phoneCoQuan: phoneCoQuan,
      phoneNhaRieng: phoneNhaRieng,
      email: email,
      gioiTinh: gioiTinh,
      ngaySinh: ngaySinh,
      cmtnd: cmtnd,
      anhDaiDienFilePath: anhDaiDienFilePath,
      anhChuKyFilePath: anhChuKyFilePath,
      anhChuKyNhayFilePath: anhChuKyNhayFilePath,
      diaChi: diaChi,
      isDeleted: isDeleted,
      thuTu: thuTu ?? 0,
      createdAt: createdAt,
      createdBy: id,
      updatedAt: updatedAt,
      updatedBy: id,
      id: id,
    );
  }

  Future<void> searchListDanhBaCaNhan({
    required int pageIndex,
    required int pageSize,
    required String keyword,
  }) async {
    loadMorePage = pageIndex;
    final result = await tienIchRep.searchListDanhBaCaNhan(
      pageIndex,
      pageSize,
      keyword,
    );
    result.when(
      success: (res) {
        if (pageIndex == ApiConstants.PAGE_BEGIN) {
          if (res.items?.isEmpty ?? true) {
            showEmpty();
          } else {
            listItemSubject.sink.add(res.items ?? []);
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

  Future<void> getListDanhBaToChuc({
    required int pageIndex,
    required int pageSize,
    required String filterBy,
    required String idDonVi,
  }) async {
    loadMorePage = pageIndex;
    final result = await tienIchRep.getListDanhBaToChuc(
      pageIndex,
      pageSize,
      filterBy,
      idDonVi,
    );
    result.when(
      success: (res) {
        if (pageIndex == ApiConstants.PAGE_BEGIN) {
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

  List<Items> listItem = [];
  Items items = Items();
  BehaviorSubject<List<Items>> listItemSubject = BehaviorSubject();

  // Future<void> getCurrentUnit(
  //   Items items,
  // ) async {
  //   this.items = gioiTinh = items.gioiTinh ?? true;
  //   ngaySinh = items.ngaySinh ?? '';
  // }

  Future<void> getListDanhBaCaNhan({
    required int pageIndex,
    required int pageSize,
  }) async {
    loadMorePage = pageIndex;
    final result = await tienIchRep.getListDanhBaCaNhan(pageIndex, pageSize);
    result.when(
      success: (res) {
        listItem = res.items ?? [];
        if (pageIndex == ApiConstants.PAGE_BEGIN) {
          if (res.items?.isEmpty ?? true) {
            showEmpty();
          } else {
            listItemSubject.sink.add(res.items ?? []);
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

  Future<void> postDanhSach({
    required String hoTen,
    required String phoneDiDong,
    required String phoneCoQuan,
    required String phoneNhaRieng,
    required String email,
    required bool gioiTinh,
    required String ngaySinh,
    required String cmtnd,
    required String anhDaiDienFilePath,
    required String anhChuKyFilePath,
    required String anhChuKyNhayFilePath,
    required String diaChi,
    required bool isDeleted,
    required int thuTu,
    required List<String> groupIds,
  }) async {
    final ThemDanhBaCaNhanRequest themDanhBaCaNhanRequest =
        ThemDanhBaCaNhanRequest(
      hoTen: hoTen,
      phone_DiDong: phoneDiDong,
      phone_CoQuan: phoneCoQuan,
      phone_NhaRieng: phoneNhaRieng,
      email: email,
      gioiTinh: gioiTinh,
      ngaySinh: ngaySinh,
      cmtnd: cmtnd,
      anhDaiDienFilePath: anhDaiDienFilePath,
      anhChuKyFilePath: anhChuKyFilePath,
      anhChuKyNhayFilePath: anhChuKyNhayFilePath,
      diaChi: diaChi,
      isDeleted: isDeleted,
      thuTu: thuTu,
      groupIds: groupIds,
    );
    final result = await tienIchRep.postThemMoiDanhBa(themDanhBaCaNhanRequest);
    result.when(
      success: (res) {
        callApiDanhSach();
      },
      error: (error) {
        showError();
      },
    );
  }

  Future<void> suaDanhSach({
    required String groups,
    required String hoTen,
    required String phoneDiDong,
    required String phoneCoQuan,
    required String phoneNhaRieng,
    required String email,
    required bool gioiTinh,
    required String ngaySinh,
    required String cmtnd,
    required String anhDaiDienFilePath,
    required String anhChuKyFilePath,
    required String anhChuKyNhayFilePath,
    required String diaChi,
    required bool isDeleted,
    required int thuTu,
    required String createdAt,
    required String createdBy,
    required String updatedAt,
    required String updatedBy,
    required String id,
  }) async {
    final SuaDanhBaCaNhanRequest suaDanhBaCaNhanRequest =
        SuaDanhBaCaNhanRequest(
      groups: groups,
      hoTen: hoTen,
      phone_DiDong: phoneDiDong,
      phone_CoQuan: phoneCoQuan,
      phone_NhaRieng: phoneNhaRieng,
      email: email,
      gioiTinh: gioiTinh,
      ngaySinh: ngaySinh,
      cmtnd: cmtnd,
      anhDaiDienFilePath: anhDaiDienFilePath,
      anhChuKyFilePath: anhChuKyFilePath,
      anhChuKyNhayFilePath: anhChuKyNhayFilePath,
      diaChi: diaChi,
      isDeleted: isDeleted,
      thuTu: thuTu,
      createdAt: createdAt,
      createdBy: createdBy,
      updatedAt: updatedAt,
      updatedBy: updatedBy,
      id: id,
    );
    final result = await tienIchRep.putSuaDanhBa(suaDanhBaCaNhanRequest);
    result.when(
      success: (res) {
        callApiDanhSach();
      },
      error: (error) {
        showError();
      },
    );
  }

  Future<void> xoaDanhBa({
    required String id,
  }) async {
    final result = await tienIchRep.xoaDanhBa(id);
    result.when(
      success: (res) {
        callApiDanhSach();
      },
      error: (error) {
        showError();
      },
    );
  }

  void searchAllDanhSach(String values) {
    final searchTxt = values.trim().toLowerCase().vietNameseParse();
    bool isListDanhSach(Items name) {
      return (name.hoTen ?? '')
          .toLowerCase()
          .vietNameseParse()
          .contains(searchTxt);
    }
    final value = listItem.where((event) => isListDanhSach(event)).toList();
    listItemSubject.add(value);
  }
}
