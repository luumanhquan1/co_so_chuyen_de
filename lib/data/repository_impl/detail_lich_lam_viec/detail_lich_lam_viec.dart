import 'package:ccvc_mobile/data/response/chi_tiet_lich_lam_viec/chi_tiet_lich_lam_viec.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/data/services/chi_tiet_lich_lam_viec_service/detail_lich_lam_viec_service.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_lich_lam_viec/chi_tiet_lich_lam_viec_model.dart';
import 'package:ccvc_mobile/domain/repository/chi_tiet_lich_lam_viec_repository/detail_lich_lam_viec_repository.dart';

class DetailLichLamViecImpl implements DetailLichLamViecRepository {
  final DetailLichLamViecService _accountService;

  DetailLichLamViecImpl(this._accountService);

  @override
  Future<Result<ChiTietLichLamViecModel>> detailCalenderWork(String id) {
    return runCatchingAsync<DetailCalenderWorkResponse,
            ChiTietLichLamViecModel>(
        () => _accountService.detailCalenderWork(id),
        (response) => response.data.toModel());
  }
}
