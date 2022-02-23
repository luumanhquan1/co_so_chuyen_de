import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/chi_tiet_van_ban_di_model.dart';

mixin ChiTietVanBanRepository {
  Future<Result<ChiTietVanBanDiModel>> getDataChiTietVanBanDi(String id);
}
