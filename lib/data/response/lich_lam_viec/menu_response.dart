import 'package:ccvc_mobile/domain/model/list_lich_lv/menu_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menu_response.g.dart';

@JsonSerializable()
class MenuResponse {
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'data')
  List<MenuDataResponse>? data;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'statusCode')
  int? statusCode;
  @JsonKey(name: 'succeeded')
  bool? succeeded;

  MenuResponse(
    this.code,
    this.data,
    this.message,
    this.statusCode,
    this.succeeded,
  );

  factory MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MenuResponseToJson(this);
}

@JsonSerializable()
class MenuDataResponse {
  @JsonKey(name: 'count')
  int? count;
  @JsonKey(name: 'hasChild')
  bool? hasChild;
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'tenDonVi')
  String? tenDonVi;
  @JsonKey(name: 'idDonViCha')
  String? idDonViCha;
  @JsonKey(name: 'idDonViGoc')
  String? idDonViGoc;
  @JsonKey(name: 'tenDonViCha')
  String? tenDonViCha;
  @JsonKey(name: 'tenDonViGoc')
  String? tenDonViGoc;

  MenuDataResponse({
    required this.count,
    required this.hasChild,
    required this.id,
    required this.tenDonVi,
    required this.idDonViCha,
    required this.idDonViGoc,
    required this.tenDonViCha,
    required this.tenDonViGoc,
  });

  factory MenuDataResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MenuDataResponseToJson(this);

  MenuModel toModel() => MenuModel(
        count: count,
        hasChild: hasChild,
        id: id,
        tenDonVi: tenDonVi,
        idDonViCha: idDonViCha,
        idDonViGoc: idDonViGoc,
        tenDonViCha: tenDonViCha,
        tenDonViGoc: tenDonViGoc,
      );
}
