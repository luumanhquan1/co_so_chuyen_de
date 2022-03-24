class DataDanhBaToChuc {
  List<ItemsToChuc>? items;
  int? pageIndex;
  int? pageSize;
  int? totalCount;
  int? totalPage;

  DataDanhBaToChuc({
    this.items,
    this.pageIndex,
    this.pageSize,
    this.totalCount,
    this.totalPage,
  });
}

class ItemsToChuc {
  String? id;
  String? maCanBo;
  String? hoTen;
  String? phoneDiDong;
  String? phoneCoQuan;
  String? phoneNhaRieng;
  String? email;
  bool? gioiTinh;
  String? gioiTinhStr;
  String? ngaySinh;
  List<String>? userName;
  String? userId;
  String? iDDonViHoatDong;
  String? iDDonViBietPhai;
  String? cmtnd;
  String? anhDaiDienFilePath;
  String? anhChuKyFilePath;
  String? anhChuKyNhayFilePath;
  bool? bitChuyenCongTac;
  String? thoiGianCapNhat;
  bool? bitNhanTinBuonEmail;
  bool? bitNhanTinBuonSMS;
  bool? bitDanhBa;
  List<String>? chucVu;
  List<String>? donVi;
  bool? bitThuTruongDonVi;
  bool? bitDauMoiPAKN;
  String? diaChi;
  String? duongDanIdDonViCha;
  String? duongDanIdDonViBietPhaiCha;
  DonViDetail? donViDetail;
  ChucVuDetail? chucVuDetail;
  String? nhomChucVuDetail;
  int? thuTu;
  int? iThuTu;
  String? tinh;
  String? huyen;
  String? xa;
  String? tinhId;
  String? huyenId;
  String? xaId;
  String? iDDonVi;
  String? iDChucVu;
  String? hinhThucNhanTin;
  String? departments;
  String? userAccounts;
  String? lsCanBoKiemNhiemResponse;

  ItemsToChuc({
    this.id,
    this.maCanBo,
    this.hoTen,
    this.phoneDiDong,
    this.phoneCoQuan,
    this.phoneNhaRieng,
    this.email,
    this.gioiTinh,
    this.gioiTinhStr,
    this.ngaySinh,
    this.userName,
    this.userId,
    this.iDDonViHoatDong,
    this.iDDonViBietPhai,
    this.cmtnd,
    this.anhDaiDienFilePath,
    this.anhChuKyFilePath,
    this.anhChuKyNhayFilePath,
    this.bitChuyenCongTac,
    this.thoiGianCapNhat,
    this.bitNhanTinBuonEmail,
    this.bitNhanTinBuonSMS,
    this.bitDanhBa,
    this.chucVu,
    this.donVi,
    this.bitThuTruongDonVi,
    this.bitDauMoiPAKN,
    this.diaChi,
    this.duongDanIdDonViCha,
    this.duongDanIdDonViBietPhaiCha,
    this.donViDetail,
    this.chucVuDetail,
    this.nhomChucVuDetail,
    this.thuTu,
    this.iThuTu,
    this.tinh,
    this.huyen,
    this.xa,
    this.tinhId,
    this.huyenId,
    this.xaId,
    this.iDDonVi,
    this.iDChucVu,
    this.hinhThucNhanTin,
    this.departments,
    this.userAccounts,
    this.lsCanBoKiemNhiemResponse,
  });
}

class DonViDetail {
  String? cayDonVi;
  String? cayDonViBietPhai;

  DonViDetail({this.cayDonVi, this.cayDonViBietPhai});
}

class ChucVuDetail {
  String? chucVu;
  String? iDNhomChucVu;
  int? thuTu;
  String? maChucVu;
  bool? isDeleted;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;
  String? id;

  ChucVuDetail({
    this.chucVu,
    this.iDNhomChucVu,
    this.thuTu,
    this.maChucVu,
    this.isDeleted,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.id,
  });
}
