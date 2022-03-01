import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/chi_tiet_van_ban_den_model.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/chi_tiet_van_ban_di_model.dart';

mixin ChiTietVanBanRepository {
  Future<Result<ChiTietVanBanDiModel>> getDataChiTietVanBanDi(String id);

  Future<Result<ChiTietVanBanDenModel>> getDataChiTietVanBanDen(
      String processId, String taskId, bool isYKien);
}
