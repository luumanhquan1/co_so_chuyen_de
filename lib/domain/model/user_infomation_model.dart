class UserInformationModel {
  String? id;
  String? canBoDepartmentId;
  String? hoTen;
  String? anhDaiDienFilePath;
  String? chucVu;
  String? donVi;
  String? email;
  String? userName;
  String? userCanBoDepartmentId;
  DonViGoc? donViGoc;
  DonViTrucThuoc? donViTrucThuoc;
  bool? gioiTinh;
  String? ngaySinh;
  String? soDienThoai;

  UserInformationModel({
    this.id,
    this.canBoDepartmentId,
    this.hoTen,
    this.anhDaiDienFilePath,
    this.chucVu,
    this.donVi,
    this.email,
    this.userName,
    this.userCanBoDepartmentId,
    this.donViGoc,
    this.donViTrucThuoc,
    this.gioiTinh,
    this.ngaySinh,
    this.soDienThoai,
  });
}

class DonViGoc {
  String? id;
  String? tenDonVi;
  String? chucVuId;
  String? chucVu;

  DonViGoc({this.id, this.tenDonVi, this.chucVuId, this.chucVu});
}

class DonViTrucThuoc {
  String? id;
  String? tenDonVi;
  String? chucVuId;
  String? chucVu;

  DonViTrucThuoc({
    this.id,
    this.tenDonVi,
    this.chucVuId,
    this.chucVu,
  });
}
