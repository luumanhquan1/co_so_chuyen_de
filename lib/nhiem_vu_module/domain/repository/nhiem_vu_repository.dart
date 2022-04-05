import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/chi_tiet_nhiem_vu_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/danh_sach_cong_viec_chi_tiet_nhiem_vu.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/lich_su_cap_nhat_thth.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/lich_su_don_doc.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/lich_su_phan_xu_ly.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/lich_su_thu_hoi.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/lich_su_tra_lai.dart';
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

  Future<Result<List<DanhSachCongViecChiTietNhiemVuModel>>> getDanhSachCongViecChiTietNhiemVu(
    String nhiemVuId,
    bool isCaNhan,
  );
  Future<Result<List<LichSuTraLaiNhiemVuModel>>> getLichSuTraLaiNhiemVu(
      String nhiemVuId,
      );
  Future<Result<List<LichSuCapNhatTHTHModel>>> getLichSuCapNhatThth(
      String nhiemVuId,
      );
  Future<Result<List<LichSuThuHoiNhiemVuModel>>> getLichSuThuHoiNhiemVu(
      String nhiemVuId,
      );
  Future<Result<List<LichSuDonDocNhiemVuModel>>> getLichSuDonDocNhiemVu(
      String nhiemVuId,
      );
}
