import 'package:ccvc_mobile/data/response/lich_lam_viec_dashbroad/lich_lam_viec_dashbroad_right_response.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/data/services/lich_lam_viec_dashbroad_service/lich_lam_viec_dashbroad_right_service.dart';
import 'package:ccvc_mobile/domain/model/lich_lam_viec/lich_lam_viec_dashbroad_item.dart';
import 'package:ccvc_mobile/domain/repository/lich_lam_viec_dashbroad_repository/lich_lam_viec_dashbroad_right_respository.dart';

class LichLamViecDashBroadRightImlp
    implements LichLamViecDashBroadRightRepository {
  LichLamViecDashBroadRightService lichLamViecDashBroadRightService;

  LichLamViecDashBroadRightImlp(this.lichLamViecDashBroadRightService);

  @override
  Future<Result<List<LichLamViecDashBroadItem>>> getLichLvRight(
    String dateStart,
    String dateTo,
    int type,
  ) {
    return runCatchingAsync<LichLamViecDashBroadRightResponse,
        List<LichLamViecDashBroadItem>>(
      () => lichLamViecDashBroadRightService.getLichLamViecRight(
        dateStart,
        dateTo,
        type,
      ),
      (response) => response.toDomain(),
    );
  }
}
