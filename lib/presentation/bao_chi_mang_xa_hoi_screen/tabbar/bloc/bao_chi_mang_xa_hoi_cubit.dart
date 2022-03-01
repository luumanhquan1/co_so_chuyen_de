import 'dart:core';

import 'package:ccvc_mobile/data/request/bao_chi_mang_xa_hoi/dash_board_tat_ca_chu_de_resquest.dart';
import 'package:ccvc_mobile/domain/repository/bao_chi_mang_xa_hoi/bao_chi_mang_xa_hoi_repository.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class BaoChiMangXaHoiBloc {
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
    // print(DateTime.now().formatApiSS);
    final result =
        await _BCMXHRepo.getDashBoardTatCaChuDe(1,30,0,true,'2022/02/22 20:17:01','2022/02/22 20:17:01');
    result.when(
      success: (res) {
        print('thanh conggggggggggggggggggggggggggggggggg');
      },
      error: (err) {
        print('that baiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
        return;
      },
    );
  }
}
