import 'package:ccvc_mobile/data/response/lich_lam_viec_dashbroad/lich_lam_viec_dashbroad_response.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/data/services/lich_lam_viec_dashbroad_service/lich_lam_viec_dashbroad_service.dart';
import 'package:ccvc_mobile/domain/model/lich_lam_viec/lich_lam_viec_dashbroad.dart';
import 'package:ccvc_mobile/domain/repository/lich_lam_viec_dashbroad_repository/lich_lam_viec_dashbroad_repository.dart';

class LichLamViecDashBroadImlp implements LichLamViecDashBroadRepository {
  LichLamViecDashBroadService lichLamViecDashBroadService;

  LichLamViecDashBroadImlp(this.lichLamViecDashBroadService);

  @override
  Future<Result<LichLamViecDashBroad>> getLichLv(
      String startTime, String endTime) {
    return runCatchingAsync<LichLamViecDashBroadResponse, LichLamViecDashBroad>(
      () => lichLamViecDashBroadService.getLichLamViec(startTime, endTime),
      (response) => response.data.toDomain(),
    );
  }
}
