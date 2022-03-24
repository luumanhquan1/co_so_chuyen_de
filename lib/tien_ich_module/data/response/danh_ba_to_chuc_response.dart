import 'package:ccvc_mobile/tien_ich_module/domain/model/danh_ba_to_chuc_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'danh_ba_to_chuc_response.g.dart';

@JsonSerializable()
class DanhBaToChucResponse extends Equatable {
  @JsonKey(name: 'data')
  DataDanhBaToChucResponse? data;

  DanhBaToChucResponse({
    this.data,
  });

  factory DanhBaToChucResponse.fromJson(Map<String, dynamic> json) =>
      _$DanhBaToChucResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DanhBaToChucResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

@JsonSerializable()
class DataDanhBaToChucResponse {
  @JsonKey(name: 'items')
  List<ItemsResponse>? items;
  @JsonKey(name: 'pageIndex')
  int? pageIndex;
  @JsonKey(name: 'pageSize')
  int? pageSize;
  @JsonKey(name: 'totalCount')
  int? totalCount;
  @JsonKey(name: 'totalPage')
  int? totalPage;

  DataDanhBaToChucResponse({
    this.items,
    this.pageIndex,
    this.pageSize,
    this.totalCount,
    this.totalPage,
  });

  factory DataDanhBaToChucResponse.fromJson(Map<String, dynamic> json) =>
      _$DataDanhBaToChucResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataDanhBaToChucResponseToJson(this);

  DataDanhBaToChuc toDomain() => DataDanhBaToChuc(
        items: items?.map((e) => e.toModel()).toList() ?? [],
        pageIndex: pageIndex,
        pageSize: pageSize,
        totalCount: totalCount,
        totalPage: totalPage,
      );
}

@JsonSerializable()
class ItemsResponse {
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
  @JsonKey(name: 'gioiTinhStr')
  String? gioiTinhStr;
  @JsonKey(name: 'ngaySinh')
  String? ngaySinh;
  @JsonKey(name: 'userName')
  List<String>? userName;
  @JsonKey(name: 'userId')
  String? userId;
  @JsonKey(name: 'iD_DonVi_HoatDong')
  String? iDDonViHoatDong;
  @JsonKey(name: 'iD_DonVi_BietPhai')
  String? iDDonViBietPhai;
  @JsonKey(name: 'cmtnd')
  String? cmtnd;
  @JsonKey(name: 'anhDaiDien_FilePath')
  String? anhDaiDienFilePath;
  @JsonKey(name: 'anhChuKy_FilePath')
  String? anhChuKyFilePath;
  @JsonKey(name: 'anhChuKyNhay_FilePath')
  String? anhChuKyNhayFilePath;
  @JsonKey(name: 'bit_ChuyenCongTac')
  bool? bitChuyenCongTac;
  @JsonKey(name: 'thoiGian_CapNhat')
  String? thoiGianCapNhat;
  @JsonKey(name: 'bit_NhanTinBuon_Email')
  bool? bitNhanTinBuonEmail;
  @JsonKey(name: 'bit_NhanTinBuon_SMS')
  bool? bitNhanTinBuonSMS;
  @JsonKey(name: 'bit_DanhBa')
  bool? bitDanhBa;
  @JsonKey(name: 'chucVu')
  List<String>? chucVu;
  @JsonKey(name: 'donVi')
  List<String>? donVi;
  @JsonKey(name: 'bit_ThuTruongDonVi')
  bool? bitThuTruongDonVi;
  @JsonKey(name: 'bitDauMoiPAKN')
  bool? bitDauMoiPAKN;
  @JsonKey(name: 'diaChi')
  String? diaChi;
  @JsonKey(name: 'duongDanIdDonViCha')
  String? duongDanIdDonViCha;
  @JsonKey(name: 'duongDanIdDonViBietPhaiCha')
  String? duongDanIdDonViBietPhaiCha;
  @JsonKey(name: 'donViDetail')
  DonViDetailResponse? donViDetail;
  @JsonKey(name: 'chucVuDetail')
  ChucVuDetailResponse? chucVuDetail;
  @JsonKey(name: 'nhomChucVuDetail')
  String? nhomChucVuDetail;
  @JsonKey(name: 'thuTu')
  int? thuTu;
  @JsonKey(name: 'iThuTu')
  int? iThuTu;
  @JsonKey(name: 'tinh')
  String? tinh;
  @JsonKey(name: 'huyen')
  String? huyen;
  @JsonKey(name: 'xa')
  String? xa;
  @JsonKey(name: 'tinhId')
  String? tinhId;
  @JsonKey(name: 'huyenId')
  String? huyenId;
  @JsonKey(name: 'xaId')
  String? xaId;
  @JsonKey(name: 'iDDonVi')
  String? iDDonVi;
  @JsonKey(name: 'iDChucVu')
  String? iDChucVu;
  @JsonKey(name: 'hinhThucNhanTin')
  String? hinhThucNhanTin;
  @JsonKey(name: 'departments')
  String? departments;
  @JsonKey(name: 'userAccounts')
  String? userAccounts;
  @JsonKey(name: 'lsCanBoKiemNhiemResponse')
  String? lsCanBoKiemNhiemResponse;

  ItemsResponse({
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

  factory ItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsResponseToJson(this);

  ItemsToChuc toModel() => ItemsToChuc(
        id: id,
        maCanBo: maCanBo,
        hoTen: hoTen,
        phoneDiDong: phoneDiDong,
        phoneCoQuan: phoneCoQuan,
        phoneNhaRieng: phoneNhaRieng,
        email: email,
        gioiTinh: gioiTinh,
        gioiTinhStr: gioiTinhStr,
        ngaySinh: ngaySinh,
        userName: userName,
        userId: userId,
        iDDonViHoatDong: iDDonViHoatDong,
        iDDonViBietPhai: iDDonViBietPhai,
        cmtnd: cmtnd,
        anhDaiDienFilePath: anhDaiDienFilePath,
        anhChuKyFilePath: anhChuKyFilePath,
        anhChuKyNhayFilePath: anhChuKyNhayFilePath,
        bitChuyenCongTac: bitChuyenCongTac,
        thoiGianCapNhat: thoiGianCapNhat,
        bitNhanTinBuonEmail: bitNhanTinBuonEmail,
        bitNhanTinBuonSMS: bitNhanTinBuonSMS,
        bitDanhBa: bitDanhBa,
        chucVu: chucVu,
        donVi: donVi,
        bitThuTruongDonVi: bitThuTruongDonVi,
        bitDauMoiPAKN: bitDauMoiPAKN,
        diaChi: diaChi,
        duongDanIdDonViCha: duongDanIdDonViCha,
        duongDanIdDonViBietPhaiCha: duongDanIdDonViBietPhaiCha,
        donViDetail: donViDetail?.toDomain() ?? DonViDetail(),
        chucVuDetail: chucVuDetail?.toDomain() ?? ChucVuDetail(),
        nhomChucVuDetail: nhomChucVuDetail,
        thuTu: thuTu,
        iThuTu: iThuTu,
        tinh: tinh,
        huyen: huyen,
        xa: xa,
        tinhId: tinhId,
        huyenId: huyenId,
        xaId: xaId,
        iDDonVi: iDDonVi,
        iDChucVu: iDChucVu,
        hinhThucNhanTin: hinhThucNhanTin,
        departments: departments,
        userAccounts: userAccounts,
        lsCanBoKiemNhiemResponse: lsCanBoKiemNhiemResponse,
      );
}

@JsonSerializable()
class DonViDetailResponse {
  @JsonKey(name: 'cayDonVi')
  String? cayDonVi;
  @JsonKey(name: 'cayDonViBietPhai')
  String? cayDonViBietPhai;

  DonViDetailResponse({this.cayDonVi, this.cayDonViBietPhai});

  factory DonViDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$DonViDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DonViDetailResponseToJson(this);

  DonViDetail toDomain() =>
      DonViDetail(cayDonVi: cayDonVi, cayDonViBietPhai: cayDonViBietPhai);
}

@JsonSerializable()
class ChucVuDetailResponse {
  @JsonKey(name: 'chucVu')
  String? chucVu;
  @JsonKey(name: 'iDNhomChucVu')
  String? iDNhomChucVu;
  @JsonKey(name: 'thuTu')
  int? thuTu;
  @JsonKey(name: 'maChucVu')
  String? maChucVu;
  @JsonKey(name: 'isDeleted')
  bool? isDeleted;
  @JsonKey(name: 'createdAt')
  String? createdAt;
  @JsonKey(name: 'createdBy')
  String? createdBy;
  @JsonKey(name: 'updatedAt')
  String? updatedAt;
  @JsonKey(name: 'updatedBy')
  String? updatedBy;
  @JsonKey(name: 'id')
  String? id;

  ChucVuDetailResponse({
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

  factory ChucVuDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ChucVuDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChucVuDetailResponseToJson(this);

  ChucVuDetail toDomain() => ChucVuDetail(
        chucVu: chucVu,
        iDNhomChucVu: iDNhomChucVu,
        thuTu: thuTu,
        maChucVu: maChucVu,
        isDeleted: isDeleted,
        createdAt: createdAt,
        createdBy: createdBy,
        updatedAt: updatedAt,
        updatedBy: updatedBy,
        id: id,
      );
}
