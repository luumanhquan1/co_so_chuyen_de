import 'dart:core';

import 'package:ccvc_mobile/data/request/bao_chi_mang_xa_hoi/dash_board_tat_ca_chu_de_resquest.dart';
import 'package:ccvc_mobile/domain/model/bao_chi_mang_xa_hoi/tat_ca_chu_de/list_chu_de.dart';
import 'package:ccvc_mobile/domain/repository/bao_chi_mang_xa_hoi/bao_chi_mang_xa_hoi_repository.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:rxdart/rxdart.dart';

class BaoChiMangXaHoiBloc {

  final BehaviorSubject<List<ChuDeModel>> _listYKienNguoiDan =
  BehaviorSubject<List<ChuDeModel>>();

  Stream<List<ChuDeModel>> get listYKienNguoiDan => _listYKienNguoiDan.stream;

  DashBoardTatCaChuDeRequest dashBoardTatCaChuDeRequest =
      DashBoardTatCaChuDeRequest(
    pageIndex: 1,
    pageSize: 30,
    total: 2220,
    hasNextPage: true,
    fromDate: DateTime.now().formatApiSS,
    toDate: DateTime.now().formatApiSS,
  );
  final BaoChiMangXaHoiRepository _BCMXHRepo = Get.find();
  Future<void> getDasBoardTatCaCuDe() async {
    final result =
        await _BCMXHRepo.getDashBoardTatCaChuDe(1,30,0,true,'2022/02/22 20:17:01','2022/02/22 20:17:01');
    result.when(
      success: (res) {
      },
      error: (err) {
        return;
      },
    );
  }

  Future<void> getListTatCaCuDe() async {
    final result =
    await _BCMXHRepo.getDashListChuDe(1,30,233,true,'2022/02/14 00:00:00','2022/02/14 23:59:59');
    result.when(
      success: (res) {
        final result= res.getlistChuDe??[];
        _listYKienNguoiDan.sink.add(result);
      },
      error: (err) {
        return;
      },
    );
  }
}
