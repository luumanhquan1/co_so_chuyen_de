import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/y_kien_nguoi_dan%20_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'danh_sach_y_kien_nguoi_dan_response.g.dart';

@JsonSerializable()
class DanhSachYKienNguoiDanResponse {
  @JsonKey(name: 'DanhSachKetQua')
  List<YKienNguoiDanData>? listDanhSachYKien;

  DanhSachYKienNguoiDanResponse(this.listDanhSachYKien);

  factory DanhSachYKienNguoiDanResponse.fromJson(Map<String, dynamic> json) =>
      _$DanhSachYKienNguoiDanResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DanhSachYKienNguoiDanResponseToJson(this);

  DanhSachYKienNguoiDan toDomain() => DanhSachYKienNguoiDan(
      listYKienNguoiDan:
          listDanhSachYKien?.map((e) => e.toDomain()).toList() ?? [],);
}

@JsonSerializable()
class YKienNguoiDanData {
  @JsonKey(name: 'Id')
  String? id;
  @JsonKey(name: 'TieuDe')
  String? tieuDe;
  @JsonKey(name: 'NgayNhan')
  String? ngayNhan;
  @JsonKey(name: 'SoNgayToiHan')
  int? soNgayToiHan;

  YKienNguoiDanData(
    this.id,
    this.tieuDe,
    this.ngayNhan,
    this.soNgayToiHan,
  );

  factory YKienNguoiDanData.fromJson(Map<String, dynamic> json) =>
      _$YKienNguoiDanDataFromJson(json);

  Map<String, dynamic> toJson() => _$YKienNguoiDanDataToJson(this);

  YKienNguoiDanModel toDomain() => YKienNguoiDanModel(
        id: id ?? '',
        tieuDe: tieuDe ?? '',
        ngayNhan: ngayNhan ?? '',
        soNgayToiHan: soNgayToiHan ?? 0,
      );
}
