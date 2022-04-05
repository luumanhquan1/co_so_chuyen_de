import 'package:ccvc_mobile/domain/model/lich_hop/thong_ke_lich_hop/co_cau_lich_hop.dart';
import 'package:json_annotation/json_annotation.dart';

part 'co_cau_lich_hop_response.g.dart';

@JsonSerializable()
class CoCauLichHopResponse {
  @JsonKey(name: 'data')
  List<CoCauLichHopData>? data;
  @JsonKey(name: 'statusCode')
  int? statusCode;
  @JsonKey(name: 'succeeded')
  bool? succeeded;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'message')
  String? message;

  CoCauLichHopResponse({
    this.data,
    this.statusCode,
    this.succeeded,
    this.code,
    this.message,
  });

  factory CoCauLichHopResponse.fromJson(Map<String, dynamic> json) =>
      _$CoCauLichHopResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoCauLichHopResponseToJson(this);

  @override
  List<Object?> get props => [];
}

@JsonSerializable()
class CoCauLichHopData {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'quantities')
  int? quantities;

  CoCauLichHopData(this.id, this.name, this.quantities);

  CoCauLichHopModel toModel() => CoCauLichHopModel(
        id: id,
        name: name,
        quantities: quantities,
      );

  factory CoCauLichHopData.fromJson(Map<String, dynamic> json) =>
      _$CoCauLichHopDataFromJson(json);

  Map<String, dynamic> toJson() => _$CoCauLichHopDataToJson(this);
}
