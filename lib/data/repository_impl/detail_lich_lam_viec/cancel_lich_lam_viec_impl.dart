import 'package:ccvc_mobile/data/response/chi_tiet_lich_lam_viec/huy_lich_lam_viec_response.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/data/services/chi_tiet_lich_lam_viec_service/cancel_lich_lam_viec_service.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_lich_lam_viec/cancel_lich_lam_viec_model.dart';
import 'package:ccvc_mobile/domain/repository/chi_tiet_lich_lam_viec_repository/cancel_lich_lam_viec_repository.dart';

class CancelLichLamViecImpl implements CancelLichLamViecRepository {
  final CancelLichLamViecService _cancelCalendarWorkService;

  CancelLichLamViecImpl(this._cancelCalendarWorkService);

  @override
  Future<Result<CancelLichLamViecModel>> cancelCalenderWork(String id) {
    return runCatchingAsync<CancelCalenderWorkResponse, CancelLichLamViecModel>(
        () => _cancelCalendarWorkService.cancelCalenderWork(id),
        (response) => response.toSucceeded());
  }
}
