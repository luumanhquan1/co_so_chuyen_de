import 'dart:io';

import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/config/base/base_state.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/danh_ba_dien_tu.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/repository/danh_ba_dien_tu_repository.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/bloc_danh_ba_dien_tu/bloc_danh_ba_dien_tu_state.dart';
import 'package:ccvc_mobile/utils/constants/api_constants.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class DanhBaDienTuCubit extends BaseCubit<BaseState> {
  DanhBaDienTuCubit() : super(DanhBaDienTuStateInitial());

  DanhBaDienTuRepository get tienIchRep => Get.find();
  int pageSize = 10;
  BehaviorSubject<File> saveFile = BehaviorSubject();
  final BehaviorSubject<String> anhDanhBaCaNhan = BehaviorSubject();

  Future<void> getListDanhBaCaNhan({
    required int pageIndex,
    required int pageSize,
  }) async {
    loadMorePage = pageIndex;
    final result = await tienIchRep.getListDanhBaCaNhan(pageIndex, pageSize);
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

  List<Items> listItem = [];
  BehaviorSubject<List<Items>> listItemSubject = BehaviorSubject();

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
