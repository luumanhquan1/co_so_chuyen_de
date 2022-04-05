import 'package:ccvc_mobile/domain/model/lich_hop/thong_ke_lich_hop/ti_le_tham_gia.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ti_le_tham_gia_response.g.dart';

@JsonSerializable()
class TiLeThamGiaResponse {
  @JsonKey(name: 'data')
  List<TiLeThamGiaData>? data;
  @JsonKey(name: 'statusCode')
  int? statusCode;
  @JsonKey(name: 'succeeded')
  bool? succeeded;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'message')
  String? message;

  TiLeThamGiaResponse({
    this.data,
    this.statusCode,
    this.succeeded,
    this.code,
    this.message,
  });

  factory TiLeThamGiaResponse.fromJson(Map<String, dynamic> json) =>
      _$TiLeThamGiaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TiLeThamGiaResponseToJson(this);

  @override
  List<Object?> get props => [];
}

@JsonSerializable()
class TiLeThamGiaData {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'rate')
  double? rate;
  @JsonKey(name: 'tenDonVi')
  String? tenDonVi;

  TiLeThamGiaData(this.id, this.rate, this.tenDonVi);

  TiLeThamGiaModel toModel() =>
      TiLeThamGiaModel(id: id, rate: rate, tenDonVi: tenDonVi);

  factory TiLeThamGiaData.fromJson(Map<String, dynamic> json) =>
      _$TiLeThamGiaDataFromJson(json);

  Map<String, dynamic> toJson() => _$TiLeThamGiaDataToJson(this);
}
