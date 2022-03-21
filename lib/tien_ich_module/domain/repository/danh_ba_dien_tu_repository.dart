import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/danh_ba_dien_tu.dart';

mixin DanhBaDienTuRepository {
  Future<Result<DanhBaDienTuModel>> getListDanhBaCaNhan(
    int pageIndex,
    int pageSize,
  );
}
