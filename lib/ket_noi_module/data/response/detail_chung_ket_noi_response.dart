import 'package:ccvc_mobile/ket_noi_module/domain/model/detail_chung_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail_chung_ket_noi_response.g.dart';

@JsonSerializable()
class DetailKetNoiResponse {
  @JsonKey(name: 'data')
  DataDetailKetNoi data;

  DetailKetNoiResponse(this.data);

  factory DetailKetNoiResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DetailKetNoiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailKetNoiResponseToJson(this);
}

@JsonSerializable()
class DataDetailKetNoi {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'tenSuKien')
  String? tenSuKien;
  @JsonKey(name: 'noiDungSuKien')
  String? noiDungSuKien;
  @JsonKey(name: 'loaiSuKien')
  List<LoaiSuKienResponse>? loaiSuKien;
  @JsonKey(name: 'thoiGianBatDau')
  String? thoiGianBatDau;
  @JsonKey(name: 'diaChi')
  String? diaChi;
  @JsonKey(name: 'danhSachHinhAnh')
  String? danhSachHinhAnh;
  @JsonKey(name: 'isPublish')
  bool? isPublish;
  @JsonKey(name: 'contactInfo')
  String? contactInfo;

  DataDetailKetNoi();

  factory DataDetailKetNoi.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DataDetailKetNoiFromJson(json);

  Map<String, dynamic> toJson() => _$DataDetailKetNoiToJson(this);

  DetailChungModel toDomain() => DetailChungModel(
        id: id,
        tenSuKien: tenSuKien,
        noiDungSuKien: noiDungSuKien,
        loaiSuKien: loaiSuKien?.map((e) => e.toModel()).toList() ?? [],
        thoiGianBatDau: thoiGianBatDau,
        diaChi: diaChi,
        danhSachHinhAnh: danhSachHinhAnh,
        isPublish: isPublish,
        contactInfo: contactInfo,
      );
}

@JsonSerializable()
class LoaiSuKienResponse {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'tenCategory')
  String? tenCategory;

  LoaiSuKienResponse();

  factory LoaiSuKienResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$LoaiSuKienResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoaiSuKienResponseToJson(this);

  LoaiSuKien toModel() => LoaiSuKien(id: id, tenCategory: tenCategory);
}
