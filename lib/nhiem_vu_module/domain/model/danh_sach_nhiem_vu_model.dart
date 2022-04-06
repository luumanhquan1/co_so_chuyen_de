class DanhSachNhiemVuModel {
  List<PageData>? pageData;
  int? totalRows;
  int? currentPage;
  int? pageSize;
  int? totalPage;

  DanhSachNhiemVuModel({
    required this.pageData,
    required this.totalRows,
    required this.currentPage,
    required this.pageSize,
    required this.totalPage,
  });
}

class PageData {
  String? id;
  String? soNhiemVu;
  String? noiDungTheoDoi;
  String? donViTheoDoi;
  String? chuyenVienTheoDoi;
  String? nguoiGiaoViec;
  String? hanXuLyVPCP;
  String? hanXuLyVPCP2;
  String? tinhHinhThucHienNoiBo;
  String? tinhHinhThucHien;
  String? hanXuLy;
  String? hanXuLy2;
  String? soKyHieuVanBan;
  String? ngayVanBan;
  String? ngayVanBan2;
  String? loaiNhiemVuId;
  String? loaiNhiemVu;
  int? trangThaiHanXuLy;
  String? trangThai;
  String? maTrangThai;
  String? trangThaiId;
  String? donViTaoId;
  String? nguoiGiaoId;
  String? nguoiTaoId;
  String? maNV;
  String? ngayTao;
  List<TrangThaiDonViXuLyModel>? trangThaiDonViXuLy;
  CongViecCon? congViecCon;
  bool? daGuiVPCP;
  String? trichYeuVanBan;
  String? noiDungDonDoc;
  String? thoiGianDonDoc;
  String? tenDonViCaNhanBiDonDoc;
  String? noiDungYKien;
  String? tenDonViCaNhanTraLai;
  String? noiDungTraLai;
  String? noiDungThuHoi;
  String? tenDonViCaNhanThuHoi;
  String? dienGiaiTrangThai;
  String? ngayHoanThanh;
  String? ngayHoanThanh2;
  bool? isChuTriTraLai;
  bool? coTheCapNhatTinhHinhThucHien;
  String? canBoId;
  String? phamViId;
  bool? coTheXoa;
  bool? coThePhanXuLy;
  bool? coTheThuHoi;
  bool? coTheDonDoc;
  bool? coTheTraLai;
  String? ngayTaoNhiemVu;
  String? ngayTaoNhiemVu2;
  bool? hasFile;
  int? wTrangThai;
  bool? isHoanThanhQuaHan;
  String? idCuocHop;

  PageData({
    this.id,
    this.soNhiemVu,
    this.noiDungTheoDoi,
    this.donViTheoDoi,
    this.chuyenVienTheoDoi,
    this.nguoiGiaoViec,
    this.hanXuLyVPCP,
    this.hanXuLyVPCP2,
    this.tinhHinhThucHienNoiBo,
    this.tinhHinhThucHien,
    this.hanXuLy,
    this.hanXuLy2,
    this.soKyHieuVanBan,
    this.ngayVanBan,
    this.ngayVanBan2,
    this.loaiNhiemVuId,
    this.loaiNhiemVu,
    this.trangThaiHanXuLy,
    this.trangThai,
    this.maTrangThai,
    this.trangThaiId,
    this.donViTaoId,
    this.nguoiGiaoId,
    this.nguoiTaoId,
    this.maNV,
    this.ngayTao,
    this.trangThaiDonViXuLy,
    this.congViecCon,
    this.daGuiVPCP,
    this.trichYeuVanBan,
    this.noiDungDonDoc,
    this.thoiGianDonDoc,
    this.tenDonViCaNhanBiDonDoc,
    this.noiDungYKien,
    this.tenDonViCaNhanTraLai,
    this.noiDungTraLai,
    this.noiDungThuHoi,
    this.tenDonViCaNhanThuHoi,
    this.dienGiaiTrangThai,
    this.ngayHoanThanh,
    this.ngayHoanThanh2,
    this.isChuTriTraLai,
    this.coTheCapNhatTinhHinhThucHien,
    this.canBoId,
    this.phamViId,
    this.coTheXoa,
    this.coThePhanXuLy,
    this.coTheThuHoi,
    this.coTheDonDoc,
    this.coTheTraLai,
    this.ngayTaoNhiemVu,
    this.ngayTaoNhiemVu2,
    this.hasFile,
    this.wTrangThai,
    this.isHoanThanhQuaHan,
    this.idCuocHop,
  });
}

class TrangThaiDonViXuLyModel {
  String? canBoId;
  String? donViId;
  String? trangThai;
  int? trangThaiHanXuLy;

  TrangThaiDonViXuLyModel({
    required this.canBoId,
    required this.donViId,
    required this.trangThai,
    required this.trangThaiHanXuLy,
  });
}

class CongViecCon {
  int? tongSo;
  int? trongHan;
  int? quaHan;
  int? toiHan;

  CongViecCon({
    this.tongSo,
    this.trongHan,
    this.quaHan,
    this.toiHan,
  });
}
