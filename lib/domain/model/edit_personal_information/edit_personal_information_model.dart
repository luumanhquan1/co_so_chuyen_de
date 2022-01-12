import 'package:ccvc_mobile/domain/model/edit_personal_information/user_accounts.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';

class EditPersonalInformationModel {
  // String? hoTen;
  // String? donVi;
  // String? chucVu;
  // String? sdt;
  // String? ngaySinh;
  // bool? gioiTinh;
  // String? email;
  // String? tenPhamVi;
  // String? user;

  String? id;
  String? maCanBo;
  String? hoTen;
  String? phoneDiDong;
  String? phoneCoQuan;
  String? phoneNhaRieng;
  String? email;
  bool? gioiTinh;
  String? ngaySinh;
  String? iDDonViHoatDong;
  String? cmtnd;
  String? anhDaiDienFilePath;
  String? anhChuKyFilePath;
  String? anhChuKyNhayFilePath;
  String? thoiGianCapNhat;
  String? chucVu;
  String? donVi;
  bool? bitThuTruongDonVi;
  bool? bitDauMoiPAKN;
  String? diaChi;
  int? thuTu;
  int? iThuTu;
  bool? tinh;
  bool? huyen;
  bool? xa;
  List<UserAccounts>? userAccounts;

  EditPersonalInformationModel(
      {this.id,
      this.maCanBo,
      this.hoTen,
      this.phoneDiDong,
      this.phoneCoQuan,
      this.email,
      this.gioiTinh,
      this.ngaySinh,
      this.cmtnd,
      this.diaChi,
      this.thuTu,
      this.tinh,
      this.huyen,
      this.xa});

  Map<String, dynamic> getInfoToMap() {
    return {
      'id': id ?? '',
      'HovaTen': hoTen ?? '',
      'maCanBo': maCanBo ?? '',
      'thuTu': thuTu ?? 0,
      'NgaySinh':
          DateTime.parse(ngaySinh ?? '').toStringWithFormat.replaceAll(' ', ''),
      'cmtnd': cmtnd ?? '',
      'GioiTinh': gioiTinh ?? false ? 'Nam' : 'Nu',
      'email': email ?? '',
      'SoDienThoaiCoQuan': phoneCoQuan ?? '',
      'SoDienThoai': phoneDiDong ?? '',
      'tinh':
          DateTime.parse(ngaySinh ?? '').toStringWithFormat.replaceAll(' ', ''),
      'huyen':
          DateTime.parse(ngaySinh ?? '').toStringWithFormat.replaceAll(' ', ''),
      'xa':
          DateTime.parse(ngaySinh ?? '').toStringWithFormat.replaceAll(' ', ''),
      'diaChi': diaChi ?? '',
    };
  }
}
