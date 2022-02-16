import 'package:ccvc_mobile/domain/model/quan_ly_van_ban/vbden_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_vbden_response.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class DataVBDenResponse extends Equatable {
  @JsonKey(name: 'Id')
  String? iD;
  @JsonKey(name: 'Code')
  String? code;
  @JsonKey(name: 'Value')
  int? value;
  DataVBDenResponse();
  factory DataVBDenResponse.fromJson(Map<String, dynamic> json) =>
      _$DataVBDenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataVBDenResponseToJson(this);

  DataVBDen toDomainVBDi() => DataVBDen(
        id: iD,
        code: code,
        value: value,
      );

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
