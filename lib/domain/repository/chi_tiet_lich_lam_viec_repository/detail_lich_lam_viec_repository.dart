import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_lich_lam_viec/chi_tiet_lich_lam_viec_model.dart';

mixin DetailLichLamViecRepository {
  Future<Result<ChiTietLichLamViecModel>> detailCalenderWork(
    String id,
  );
}
