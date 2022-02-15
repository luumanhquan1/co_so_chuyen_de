class UserInformation {
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
  int? soDienThoai;

  UserInformation(
      {this.id,
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
      this.soDienThoai});

  UserInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    canBoDepartmentId = json['canBoDepartmentId'];
    hoTen = json['hoTen'];
    anhDaiDienFilePath = json['anhDaiDien_FilePath'];
    chucVu = json['chucVu'];
    donVi = json['donVi'];
    email = json['email'];
    userName = json['userName'];
    userCanBoDepartmentId = json['userCanBoDepartmentId'];
    donViGoc = json['donViGoc'] != null
        ? DonViGoc.fromJson(json['donViGoc'])
        : null;
    donViTrucThuoc = json['donViTrucThuoc'] != null
        ? DonViTrucThuoc.fromJson(json['donViTrucThuoc'])
        : null;
    gioiTinh = json['gioiTinh'];
    ngaySinh = json['ngaySinh'];
    soDienThoai = json['soDienThoai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['canBoDepartmentId'] = canBoDepartmentId;
    data['hoTen'] = hoTen;
    data['anhDaiDien_FilePath'] = anhDaiDienFilePath;
    data['chucVu'] = chucVu;
    data['donVi'] = donVi;
    data['email'] = email;
    data['userName'] = userName;
    data['userCanBoDepartmentId'] = userCanBoDepartmentId;
    if (this.donViGoc != null) {
      data['donViGoc'] = donViGoc!.toJson();
    }
    if (this.donViTrucThuoc != null) {
      data['donViTrucThuoc'] = donViTrucThuoc!.toJson();
    }
    data['gioiTinh'] = gioiTinh;
    data['ngaySinh'] = ngaySinh;
    data['soDienThoai'] = soDienThoai;
    return data;
  }
}

class DonViGoc {
  String? id;
  String? tenDonVi;
  String? chucVuId;
  String? chucVu;

  DonViGoc({this.id, this.tenDonVi, this.chucVuId, this.chucVu});

  DonViGoc.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenDonVi = json['tenDonVi'];
    chucVuId = json['chucVuId'];
    chucVu = json['chucVu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['tenDonVi'] = tenDonVi;
    data['chucVuId'] = chucVuId;
    data['chucVu'] = chucVu;
    return data;
  }
}

class DonViTrucThuoc {
  String? id;
  String? tenDonVi;
  String? chucVuId;
  String? chucVu;

  DonViTrucThuoc({this.id, this.tenDonVi, this.chucVuId, this.chucVu});

  DonViTrucThuoc.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenDonVi = json['tenDonVi'];
    chucVuId = json['chucVuId'];
    chucVu = json['chucVu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['tenDonVi'] = tenDonVi;
    data['chucVuId'] = chucVuId;
    data['chucVu'] = chucVu;
    return data;
  }
}
