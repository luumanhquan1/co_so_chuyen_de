import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_lich_lam_viec/chi_tiet_lich_lam_viec_model.dart';
import 'package:ccvc_mobile/domain/model/lich_lam_viec/lich_lam_viec_dashbroad.dart';
import 'package:ccvc_mobile/domain/model/lich_lam_viec/lich_lam_viec_dashbroad_item.dart';

mixin LichLamViecRepository {
  Future<Result<LichLamViecDashBroad>> getLichLv(
    String startTime,
    String endTime,
  );

  Future<Result<List<LichLamViecDashBroadItem>>> getLichLvRight(
    String dateStart,
    String dateTo,
    int type,
  );
  Future<Result<ChiTietLichLamViecModel>> detailCalenderWork(
      String id,
      );
}
