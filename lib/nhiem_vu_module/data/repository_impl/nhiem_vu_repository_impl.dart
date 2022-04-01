import 'package:ccvc_mobile/nhiem_vu_module/data/service/nhiem_vu_service.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/repository/nhiem_vu_repository.dart';

class NhiemVuRepoImpl implements NhiemVuRepository {
  final NhiemVuService nhiemVuService;

  NhiemVuRepoImpl(this.nhiemVuService);
}
