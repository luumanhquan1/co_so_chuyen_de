import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'manager_personal_information_response.g.dart';
@JsonSerializable()
class ManagerPersonalInformationResponse extends Equatable {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'maCanBo')
  String? maCanBo;
  @JsonKey(name: 'hoTen')
  String? hoTen;
  @JsonKey(name: 'phone_DiDong')
  String? phoneDiDong;
  @JsonKey(name: 'phone_CoQuan')
  String? phoneCoQuan;
  @JsonKey(name: 'phone_NhaRieng')
  String? phoneNhaRieng;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'gioiTinh')
  bool? gioiTinh;
  @JsonKey(name: 'ngaySinh')
  String? ngaySinh;
  @JsonKey(name: 'iD_DonVi_HoatDong')
  String? iDDonViHoatDong;
  @JsonKey(name: 'cmtnd')
  String? cmtnd;
  @JsonKey(name: 'anhDaiDien_FilePath')
  String? anhDaiDienFilePath;
  @JsonKey(name: 'anhChuKy_FilePath')
  String? anhChuKyFilePath;
  @JsonKey(name: 'anhChuKyNhay_FilePath')
  String? anhChuKyNhayFilePath;
  @JsonKey(name: 'thoiGian_CapNhat')
  String? thoiGianCapNhat;
  @JsonKey(name: 'chucVu')
  String? chucVu;
  @JsonKey(name: 'donVi')
  String? donVi;
  @JsonKey(name: 'diaChi')
  String? diaChi;
  @JsonKey(name: 'thuTu')
  int? thuTu;
  @JsonKey(name: '_ThuTu')
  int? iThuTu;
  @JsonKey(name: 'tinh')
  String? tinh;
  @JsonKey(name: 'huyen')
  String? huyen;
  @JsonKey(name: 'xa')
  String? xa;

  //
  @JsonKey(name: 'diaChi')
  bool? isDefault;
  @JsonKey(name: 'diaChi')
  int? trangThai;
  @JsonKey(name: 'diaChi')
  String? ungDung;

//

  ManagerPersonalInformationResponse();

  factory ManagerPersonalInformationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ManagerPersonalInformationResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ManagerPersonalInformationResponseToJson(this);

  @override
  List<Object?> get props => throw UnimplementedError();
}
