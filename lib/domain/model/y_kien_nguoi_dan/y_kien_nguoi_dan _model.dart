class DanhSachYKienNguoiDan {
  List<YKienNguoiDanModel> listYKienNguoiDan;

  DanhSachYKienNguoiDan({required this.listYKienNguoiDan});
}

class YKienNguoiDanModel {
  String id;
  String tieuDe;
  String ngayNhan;
  int soNgayToiHan;

  YKienNguoiDanModel({
    required this.id,
    required this.tieuDe,
    required this.ngayNhan,
    required this.soNgayToiHan,
  });
}
