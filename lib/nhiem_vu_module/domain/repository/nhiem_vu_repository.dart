import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/chi_tiet_nhiem_vu_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/lich_su_phan_xu_ly.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/y_kien_su_ly_nhiem_vu_model.dart';

mixin NhiemVuRepository {
  Future<Result<ChiTietNhiemVuModel>> getChiTietNhiemVu(
    String nhiemVuId,
    bool isCaNhan,
  );

  Future<Result<List<LichSuPhanXuLyNhiemVuModel>>> getLichSuPhanXuLy(
    String nhiemVuId,
  );
  Future<Result<List<YKienSuLyNhiemVuModel>>> getYKienXuLyNhiemVu(
      String nhiemVuId,
      );
}
