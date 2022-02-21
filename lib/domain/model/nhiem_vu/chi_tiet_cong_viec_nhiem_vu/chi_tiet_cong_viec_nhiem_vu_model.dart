import 'package:ccvc_mobile/generated/l10n.dart';

class ChiTietCongViecNhiemVuModel {
  String? dvGiaoviec;
  String? nguoiGiaoViec;
  String? dvCaNhanThucHien;
  String? hanXuLy;
  String? mucDoCongViec;
  String? noiDung;

  ChiTietCongViecNhiemVuModel(
      {this.dvGiaoviec,
      this.nguoiGiaoViec,
      this.dvCaNhanThucHien,
      this.hanXuLy,
      this.mucDoCongViec,
      this.noiDung});

  List<ChiTietCongViecNhiemVuRow> toListMobile() {
    final List<ChiTietCongViecNhiemVuRow> list = [
      ChiTietCongViecNhiemVuRow(S.current.don_vi_giao_viec, dvGiaoviec ?? ''),
      ChiTietCongViecNhiemVuRow(S.current.nguoi_giao_viec, nguoiGiaoViec ?? ''),
      ChiTietCongViecNhiemVuRow(
          S.current.dv_ca_nhan_thuc_hien, dvCaNhanThucHien ?? ''),
      ChiTietCongViecNhiemVuRow(S.current.han_xu_ly, hanXuLy ?? ''),
      ChiTietCongViecNhiemVuRow(
          S.current.muc_do_cong_viec, mucDoCongViec ?? ''),
      ChiTietCongViecNhiemVuRow(S.current.noi_dung, noiDung ?? ''),
    ];
    return list;
  }

}

class ChiTietCongViecNhiemVuRow {
  String title = '';
  dynamic value;

  ChiTietCongViecNhiemVuRow(this.title, this.value);
}
