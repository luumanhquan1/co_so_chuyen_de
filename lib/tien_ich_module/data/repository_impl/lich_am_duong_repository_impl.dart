import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/tien_ich_module/data/service/lich_am_duong_service.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/lich_am_duong.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/repository/lich_am_duong_repository.dart';
import 'package:ccvc_mobile/tien_ich_module/data/response/lich_am_duong_response.dart';

class LichAmDuongRepositoryImpl implements LichAmDuongRepository {
  final LichAmDuongService _lichAmDuongService;

  LichAmDuongRepositoryImpl(this._lichAmDuongService);

  @override
  Future<Result<LichAmDuong>> getLichAmDuong(String date) {
    return runCatchingAsync<DataLichAmDuongResponse, LichAmDuong>(
            () => _lichAmDuongService.getLichAmDuong(date),
            (response) => response.data?.toModel()??LichAmDuong());
  }
}
