class DanhBaDienTuModel {
  List<Items>? items;
  int? pageIndex;
  int? pageSize;
  int? totalCount;
  int? totalPage;

  DanhBaDienTuModel({
    this.items,
    this.pageIndex,
    this.pageSize,
    this.totalCount,
    this.totalPage,
  });
}

class Items {
  String? groups;
  String? hoTen;
  String? phoneDiDong;
  String? phoneCoQuan;
  String? phoneNhaRieng;
  String? email;
  bool? gioiTinh;
  String? ngaySinh;
  String? cmtnd;
  String? anhDaiDienFilePath;
  String? anhChuKyFilePath;
  String? anhChuKyNhayFilePath;
  String? diaChi;
  bool? isDeleted;
  int? thuTu;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;
  String? id;

  Items({
    this.groups,
    this.hoTen,
    this.phoneDiDong,
    this.phoneCoQuan,
    this.phoneNhaRieng,
    this.email,
    this.gioiTinh,
    this.ngaySinh,
    this.cmtnd,
    this.anhDaiDienFilePath,
    this.anhChuKyFilePath,
    this.anhChuKyNhayFilePath,
    this.diaChi,
    this.isDeleted,
    this.thuTu,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.id,
  });
}
