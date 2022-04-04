import 'package:ccvc_mobile/nhiem_vu_module/domain/model/dash_broash/dash_broash_nhiem_vu_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dash_broash_cong_viec_response.g.dart';

@JsonSerializable()
class DashBroashCongViecResponse {
  @JsonKey(name: 'Data')
  DataCongViecResponse? data;

  DashBroashCongViecResponse(this.data);

  factory DashBroashCongViecResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DashBroashCongViecResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DashBroashCongViecResponseToJson(this);

  DashBroashNhiemVu toMoDel() =>
      DashBroashNhiemVu(data: data?.toModel() ?? DataModel());
}

@JsonSerializable()
class DataCongViecResponse {
  @JsonKey(name: 'TrangThai')
  List<LoaiNhiemVuResponse>? trangThai;
  @JsonKey(name: 'TrangThaiXuLy')
  List<LoaiNhiemVuResponse>? trangThaiXuLy;

  DataCongViecResponse();

  factory DataCongViecResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DataCongViecResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataCongViecResponseToJson(this);

  DataModel toModel() => DataModel(
        trangThai: trangThai?.map((e) => e.toMoDel()).toList() ?? [],
        trangThaiXuLy: trangThaiXuLy?.map((e) => e.toMoDel()).toList() ?? [],
      );
}

@JsonSerializable()
class LoaiNhiemVuResponse {
  @JsonKey(name: 'Id')
  String? id;
  @JsonKey(name: 'GiaTri')
  String? giaTri;
  @JsonKey(name: 'Text')
  String? text;
  @JsonKey(name: 'Value')
  int? value;
  @JsonKey(name: 'IsDonVi')
  bool? isDonVi;
  @JsonKey(name: 'TypeCode')
  String? typeCode;

  LoaiNhiemVuResponse({
    this.id,
    this.giaTri,
    this.text,
    this.value,
    this.isDonVi,
    this.typeCode,
  });

  factory LoaiNhiemVuResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$LoaiNhiemVuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoaiNhiemVuResponseToJson(this);

  LoaiNhiemVuComomModel toMoDel() => LoaiNhiemVuComomModel(
        id: id,
        giaTri: giaTri,
        text: text,
        value: value,
        isDonVi: isDonVi,
        typeCode: typeCode,
      );
}
