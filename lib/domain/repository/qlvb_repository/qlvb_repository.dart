import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/domain/model/quan_ly_van_ban/van_ban_di_model.dart';
import 'package:ccvc_mobile/domain/model/quan_ly_van_ban/van_ban_model.dart';

mixin QLVBRepository {
  Future<Result<DanhSachVanBanModel>> getVanBanModel();

  Future<Result<DanhSachVanBanModel>> getDanhSachVbDen(
      String startDate, String endDate, int index, int size);

  Future<Result<DanhSachVanBanDiModel>> getDanhSachVbDi(
      String startDate, String endDate, int index, int size);
}