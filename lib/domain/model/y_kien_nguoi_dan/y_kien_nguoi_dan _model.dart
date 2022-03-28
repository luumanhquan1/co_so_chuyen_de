class DanhSachYKienNguoiDan {
  List<YKienNguoiDanModel> listYKienNguoiDan;

  DanhSachYKienNguoiDan({required this.listYKienNguoiDan});
}

class YKienNguoiDanModel {
  String id;
  String tieuDe;
  String ngayNhan;
  int soNgayToiHan;
  String taskID;

  YKienNguoiDanModel({
    required this.id,
    required this.tieuDe,
    required this.ngayNhan,
    required this.soNgayToiHan,
    required this.taskID,
  });
}
