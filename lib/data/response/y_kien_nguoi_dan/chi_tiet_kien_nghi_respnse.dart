import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/chi_tiet_yknd_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chi_tiet_kien_nghi_respnse.g.dart';

@JsonSerializable()
class ChiTietKienNghiResponse {
  @JsonKey(name: 'Data')
  HeaderKienNghiData headerKienNghiData;
  ThongTinNguoiPhanAnhData thongTinNguoiPhanAnhData;

  ChiTietKienNghiResponse(this.headerKienNghiData,this.thongTinNguoiPhanAnhData);

  factory ChiTietKienNghiResponse.fromJson(Map<String, dynamic> json) =>
      _$ChiTietKienNghiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChiTietKienNghiResponseToJson(this);
  ChiTietYKNDModel toDomain() => ChiTietYKNDModel(
     headerChiTietYKNDModel: headerKienNghiData.toDomain(),
      nguoiPhanAnhModel: thongTinNguoiPhanAnhData.toDomain(),

  );

}

@JsonSerializable()
class HeaderKienNghiData {
  @JsonKey(name: 'TieuDe')
  final String? tieuDe;
  @JsonKey(name: 'NoiDung')
  final String? noiDung;
  @JsonKey(name: 'TenNguonPAKN')
  final String? nguonPAKN;
  @JsonKey(name: 'PhanLoaiPAKN')
  final String? phanLoaiPAKN;
  @JsonKey(name: 'NgayPhanAnh')
  final String? ngayPhanAnh;
  @JsonKey(name: 'HanXuLy')
  final String? hanXuLy;
  @JsonKey(name: 'TenLuat')
  final String? quyDinhLuat;
  @JsonKey(name: 'DSTaiLieuDinhKem')
  final String? taiLieuCongDan;

  HeaderKienNghiData(
      this.tieuDe,
      this.noiDung,
      this.nguonPAKN,
      this.phanLoaiPAKN,
      this.ngayPhanAnh,
      this.hanXuLy,
      this.taiLieuCongDan,
      this.quyDinhLuat,
      );

  factory HeaderKienNghiData.fromJson(Map<String, dynamic> json) =>
      _$HeaderKienNghiDataFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderKienNghiDataToJson(this);

  HeaderChiTietYKNDModel toDomain() => HeaderChiTietYKNDModel(
    tieuDe: tieuDe,
    noiDung: noiDung,
    nguonPAKN: nguonPAKN,
    phanLoaiPAKN: phanLoaiPAKN,
    ngayPhanAnh: ngayPhanAnh,
    hanXuLy: hanXuLy,
    taiLieuCongDan: taiLieuCongDan,
    quyDinhLuat: quyDinhLuat,
  );
}

@JsonSerializable()
class ThongTinNguoiPhanAnhData {
  @JsonKey(name: 'DoiTuongId')
  int? doiTuong;
  @JsonKey(name: 'TenNguoiPhanAnh')
  String? tenCaNhan;
  @JsonKey(name: 'CMTND')
  String? cmnd;
  @JsonKey(name: 'Email')
  String? diaChiEmail;
  @JsonKey(name: 'SoDienThoai')
  String? soDienthoai;
  @JsonKey(name: 'DiaChiChiTiet')
  String? diaChiChiTiet;

  ThongTinNguoiPhanAnhData(
      this.doiTuong,
      this.tenCaNhan,
      this.cmnd,
      this.diaChiEmail,
      this.soDienthoai,
      this.diaChiChiTiet,
      );

  factory ThongTinNguoiPhanAnhData.fromJson(Map<String, dynamic> json) =>
      _$ThongTinNguoiPhanAnhDataFromJson(json);

  Map<String, dynamic> toJson() => _$ThongTinNguoiPhanAnhDataToJson(this);

  NguoiPhanAnhModel toDomain() => NguoiPhanAnhModel(
    doiTuong:doiTuong,
    tenCaNhan: tenCaNhan,
    cmnd: cmnd,
    diaChiEmail: diaChiEmail,
    diaChiChiTiet: diaChiChiTiet,
    soDienthoai: soDienthoai,

  );
}

