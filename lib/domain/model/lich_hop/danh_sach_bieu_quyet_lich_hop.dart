class DanhSachBieuQuyetLichHopData {
  List<DanhSachBieuQuyetLichHopModel>? data;
  int? statusCode;
  bool? succeeded;
  String? code;
  String? message;

  DanhSachBieuQuyetLichHopData({
    this.data,
    this.statusCode,
    this.succeeded,
    this.code,
    this.message,
  });
}

class DanhSachBieuQuyetLichHopModel {
  String? tenChucVu;
  bool? diemDanh;
  bool? disable;
  int? trangThai;
  bool? isVangMat;
  String? id;
  String? lichHopId;
  String? donViId;
  String? canBoId;
  String? vaiTro;
  String? ghiChu;
  String? parentId;
  int? vaiTroThamGia;
  String? email;
  String? soDienThoai;
  String? dauMoiLienHe;
  String? tenCanBo;
  String? tenCoQuan;
  bool? isThuKy;
  bool? isThamGiaBocBang;
  String? createAt;

  DanhSachBieuQuyetLichHopModel({
    this.tenChucVu,
    this.diemDanh,
    this.disable,
    this.trangThai,
    this.isVangMat,
    this.id,
    this.lichHopId,
    this.donViId,
    this.canBoId,
    this.vaiTro,
    this.ghiChu,
    this.parentId,
    this.vaiTroThamGia,
    this.email,
    this.soDienThoai,
    this.dauMoiLienHe,
    this.tenCanBo,
    this.tenCoQuan,
    this.isThuKy,
    this.isThamGiaBocBang,
    this.createAt,
  });
}