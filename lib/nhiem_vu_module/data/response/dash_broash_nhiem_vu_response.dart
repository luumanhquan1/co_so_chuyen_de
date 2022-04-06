import 'package:ccvc_mobile/nhiem_vu_module/domain/model/dash_broash/dash_broash_nhiem_vu_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dash_broash_nhiem_vu_response.g.dart';

@JsonSerializable()
class DashBroashResponse {
  @JsonKey(name: 'Data')
  DataResponse? data;

  DashBroashResponse(this.data);

  factory DashBroashResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DashBroashResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DashBroashResponseToJson(this);

  DashBroashNhiemVu toMoDel() =>
      DashBroashNhiemVu(data: data?.toModel() ?? DataModel());
}

@JsonSerializable()
class DataResponse {
  @JsonKey(name: 'LoaiNhiemVu')
  List<LoaiNhiemVuCommon>? loaiNhiemVu;
  @JsonKey(name: 'TrangThai')
  List<LoaiNhiemVuCommon>? trangThai;
  @JsonKey(name: 'TrangThaiXuLy')
  List<LoaiNhiemVuCommon>? trangThaiXuLy;

  DataResponse();

  factory DataResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataResponseToJson(this);

  DataModel toModel() => DataModel(
        loaiNhiemVu: loaiNhiemVu?.map((e) => e.toMoDel()).toList() ?? [],
        trangThai: trangThai?.map((e) => e.toMoDel()).toList() ?? [],
        trangThaiXuLy: trangThaiXuLy?.map((e) => e.toMoDel()).toList() ?? [],
      );
}

@JsonSerializable()
class LoaiNhiemVuCommon {
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

  LoaiNhiemVuCommon({
    this.id,
    this.giaTri,
    this.text,
    this.value,
    this.isDonVi,
    this.typeCode,
  });

  factory LoaiNhiemVuCommon.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$LoaiNhiemVuCommonFromJson(json);

  Map<String, dynamic> toJson() => _$LoaiNhiemVuCommonToJson(this);

  LoaiNhiemVuComomModel toMoDel() => LoaiNhiemVuComomModel(
        id: id,
        giaTri: giaTri,
        text: text,
        value: value,
        isDonVi: isDonVi,
        typeCode: typeCode,
      );
}
