import 'package:ccvc_mobile/data/response/chi_tiet_van_ban/chi_tiet_van_ban_di_response.dart';
import 'package:ccvc_mobile/data/response/chi_tiet_van_ban/chi_tiet_van_ban_den_response.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/chi_tiet_van_ban_den_model.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/chi_tiet_van_ban_di_model.dart';
import 'package:ccvc_mobile/domain/repository/chi_tiet_van_ban_repository/chi_tiet_van_ban_di_repository.dart';
import 'package:ccvc_mobile/data/services/chi_tiet_van_ban/chi_tiet_van_ban_service.dart';

class ChiTietVanBanImpl implements ChiTietVanBanRepository {
  final ChiTietVanBanService _chiTietVanBanService;

  ChiTietVanBanImpl(this._chiTietVanBanService);

  @override
  Future<Result<ChiTietVanBanDiModel>> getDataChiTietVanBanDi(String id) {
    return runCatchingAsync<ChiTietVanBanDiDataResponse, ChiTietVanBanDiModel>(
        () => _chiTietVanBanService.getDataChiTietVanBanDi(id),
        (response) => response.data.toModel());
  }

  @override
  Future<Result<ChiTietVanBanDenModel>> getDataChiTietVanBanDen(
      String processId, String taskId, bool isYKien) {
    return runCatchingAsync<ChiTietVanBanDenDataResponse,
            ChiTietVanBanDenModel>(
        () => _chiTietVanBanService.getDataChiTietVanBanDen(
            processId, taskId, isYKien),
        (response) => response.data!.toModel());
  }
}
