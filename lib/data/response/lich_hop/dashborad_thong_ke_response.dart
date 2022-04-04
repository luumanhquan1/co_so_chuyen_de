import 'package:ccvc_mobile/domain/model/lich_hop/thong_ke_lich_hop/dashboard_thong_ke_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashborad_thong_ke_response.g.dart';

@JsonSerializable()
class DashBoardThongKeResponse {
  @JsonKey(name: 'data')
  List<DashBoardThongKeData>? data;
  @JsonKey(name: 'statusCode')
  int? statusCode;
  @JsonKey(name: 'succeeded')
  bool? succeeded;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'message')
  String? message;

  DashBoardThongKeResponse({
    this.data,
    this.statusCode,
    this.succeeded,
    this.code,
    this.message,
  });

  factory DashBoardThongKeResponse.fromJson(Map<String, dynamic> json) =>
      _$DashBoardThongKeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DashBoardThongKeResponseToJson(this);

  @override
  List<Object?> get props => [];
}

@JsonSerializable()
class DashBoardThongKeData {
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'quantities')
  int? quantities;

  DashBoardThongKeData(this.code, this.name, this.quantities);

  DashBoardThongKeModel toModel() => DashBoardThongKeModel(
        code: code,
        name: name,
        quantities: quantities,
      );

  factory DashBoardThongKeData.fromJson(Map<String, dynamic> json) =>
      _$DashBoardThongKeDataFromJson(json);

  Map<String, dynamic> toJson() => _$DashBoardThongKeDataToJson(this);
}
