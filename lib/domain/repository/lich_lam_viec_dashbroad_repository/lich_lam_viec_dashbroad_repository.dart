
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/domain/model/lich_lam_viec/lich_lam_viec_dashbroad.dart';

mixin LichLamViecDashBroadRepository {
  Future<Result<LichLamViecDashBroad>> getLichLv(String startTime,
      String endTime,);
}
