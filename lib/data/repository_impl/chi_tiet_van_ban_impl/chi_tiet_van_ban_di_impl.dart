import 'package:ccvc_mobile/data/response/chi_tiet_van_ban/chi_tiet_van_ban_di_response.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/chi_tiet_van_ban_di_model.dart';
import 'package:ccvc_mobile/domain/repository/chi_tiet_van_ban_repository/chi_tiet_van_ban_di_repository.dart';
import 'package:ccvc_mobile/data/services/chi_tiet_van_ban/chi_tiet_van_ban_di_service.dart';

class ChiTietVanBanDiImpl implements ChiTietVanBanRepository {
  final ChiTietVanBanDiService _chiTietVanBanDiService;

  ChiTietVanBanDiImpl(this._chiTietVanBanDiService);

  @override
  Future<Result<ChiTietVanBanDiModel>> getDataChiTietVanBanDi(String id) {
    return runCatchingAsync<ChiTietVanBanDiDataResponse,
        ChiTietVanBanDiModel>(() => _chiTietVanBanDiService.getDataChiTietVanBanDi(id),
            (response) => response.data.toModel());
  }

}