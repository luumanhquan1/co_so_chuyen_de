import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/nhiem_vu_module/data/request/danh_sach_cong_viec_request.dart';
import 'package:ccvc_mobile/nhiem_vu_module/data/request/danh_sach_nhiem_vu_request.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_cong_viec_nhiem_vu/chi_tiet_cong_viec_nhiem_vu_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/chi_tiet_nhiem_vu_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/danh_sach_cong_viec_chi_tiet_nhiem_vu.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/lich_su_cap_nhat_thth.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/lich_su_don_doc.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/lich_su_phan_xu_ly.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/lich_su_thu_hoi.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/lich_su_tra_lai.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/y_kien_su_ly_nhiem_vu_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/danh_sach_cong_viec_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/danh_sach_nhiem_vu_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/dash_broash/dash_broash_nhiem_vu_model.dart';

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

  Future<Result<DanhSachNhiemVuModel>> danhSachNhiemVu(
    DanhSachNhiemVuRequest danhSachNhiemVuRequest,
  );

  Future<Result<DanhSachCongViecModel>> danhSachCongViec(
    DanhSachCongViecRequest danhSachCongViecRequest,
  );

  Future<Result<DashBroashNhiemVu>> getDashBroashNhiemVu(
    String ngayDauTien,
    String ngayCuoiCung,
  );

  Future<Result<DashBroashNhiemVu>> getDashBroashCongViec(
    String ngayDauTien,
    String ngayCuoiCung,
  );

  Future<Result<DashBroashNhiemVu>> getDashBroashNhiemVuCaNhan(
    String ngayDauTien,
    String ngayCuoiCung,
  );

  Future<Result<DashBroashNhiemVu>> getDashBroashCongViecCaNhan(
    String ngayDauTien,
    String ngayCuoiCung,
  );

  Future<Result<List<DanhSachCongViecChiTietNhiemVuModel>>>
      getDanhSachCongViecChiTietNhiemVu(
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

  Future<Result<ChiTietCongViecNhiemVuModel>> getChiTietCongViec(
    String congViecId,
  );
}