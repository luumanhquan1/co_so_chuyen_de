

import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/domain/model/quan_ly_van_ban/van_ban_model.dart';

mixin QLVBRepository {
  // Future<Result<VBDenModel>> getVBDen(
  //   String startTime,
  //   String endTime,
  // );
  //
  // Future<Result<VBDiModel>> getVBDi(
  //   String startTime,
  //   String endTime,
  // );

  Future<Result<DanhSachVanBanModel>> getVanBanModel();

  // Future<Result<PageVBDiModel>> getDanhSachVbDi(
  //     String startDate, String endDate, int index, int size);
}
