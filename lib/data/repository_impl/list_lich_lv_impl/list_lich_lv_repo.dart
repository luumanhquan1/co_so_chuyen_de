import 'package:ccvc_mobile/data/request/list_lich_lv/list_lich_lv_request.dart';
import 'package:ccvc_mobile/data/response/list_lich_lv/list_lich_lv_response.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/data/services/list_lv/list_lich_lv_service.dart';
import 'package:ccvc_mobile/domain/model/list_lich_lv/list_lich_lv_model.dart';
import 'package:ccvc_mobile/domain/repository/list_lich_lv/list_lich_lv_responsitory.dart';

class ListLichLvRepositoryImpl implements ListLichLvRepository {
  final ListLichLvService listLichLvService;

  ListLichLvRepositoryImpl(this.listLichLvService);

  @override
  Future<Result<DataLichLvModel>> getListLichLamViec(
      ListLichLvRequest lichLvRequest) {
    return runCatchingAsync<ListLichLvResponse, DataLichLvModel>(
      () => listLichLvService.getListLichLv(lichLvRequest),
      (response) => response.data.toDomain(),
    );
  }
}
