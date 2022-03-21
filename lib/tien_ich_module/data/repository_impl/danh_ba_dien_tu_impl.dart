import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/tien_ich_module/data/response/danh_ba_dien_tu_response.dart';
import 'package:ccvc_mobile/tien_ich_module/data/service/danh_ba_dien_tu_service.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/danh_ba_dien_tu.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/repository/danh_ba_dien_tu_repository.dart';

class DanhBaDienTuImpl implements DanhBaDienTuRepository {
  final DanhBaDienTuService danhBaDienTuService;

  DanhBaDienTuImpl(this.danhBaDienTuService);

  @override
  Future<Result<DanhBaDienTuModel>> getListDanhBaCaNhan(
    int pageIndex,
    int pageSize,
  ) {
    return runCatchingAsync<DanhBaResponse, DanhBaDienTuModel>(
        () => danhBaDienTuService.getListDanhBaCaNhan(pageIndex, pageSize),
        (response) {
      return response.data?.toDomain() ?? DanhBaDienTuModel();
    });
  }
}
