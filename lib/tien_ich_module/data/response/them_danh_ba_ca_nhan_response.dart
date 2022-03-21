import 'package:ccvc_mobile/tien_ich_module/domain/model/them_moi_danh_ba_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'them_danh_ba_ca_nhan_response.g.dart';

@JsonSerializable()
class ThemDanhBaCaNhanResponse extends Equatable {
  @JsonKey(name: 'data')
  DataResponse? dataResponse;

  ThemDanhBaCaNhanResponse({required this.dataResponse});

  factory ThemDanhBaCaNhanResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ThemDanhBaCaNhanResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ThemDanhBaCaNhanResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

@JsonSerializable()
class DataResponse {
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

  DataResponse({
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

  factory DataResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataResponseToJson(this);

  ThemMoiDanhBaModel toModel() => ThemMoiDanhBaModel(
        hoTen: hoTen,
        phoneDiDong: phoneDiDong,
        phoneCoQuan: phoneCoQuan,
        phoneNhaRieng: phoneNhaRieng,
        email: email,
        gioiTinh: gioiTinh,
        ngaySinh: ngaySinh,
        cmtnd: cmtnd,
        anhDaiDienFilePath: anhDaiDienFilePath,
        anhChuKyFilePath: anhChuKyFilePath,
        anhChuKyNhayFilePath: anhChuKyNhayFilePath,
        diaChi: diaChi,
        isDeleted: isDeleted,
        thuTu: thuTu,
        createdAt: createdAt,
        createdBy: createdBy,
        updatedAt: updatedAt,
        updatedBy: updatedBy,
        id: id,
      );
}
