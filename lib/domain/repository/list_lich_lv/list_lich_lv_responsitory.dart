import 'package:ccvc_mobile/data/request/list_lich_lv/list_lich_lv_request.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/domain/model/list_lich_lv/list_lich_lv_model.dart';

mixin ListLichLvRepository {
  Future<Result<DataLichLvModel>> getListLichLamViec(
    ListLichLvRequest lichLvRequest,
  );
}
