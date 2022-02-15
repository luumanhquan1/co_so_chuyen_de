import 'package:ccvc_mobile/data/response/quan_ly_van_ban/data_qlvb_response.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vb_di_response.g.dart';

@JsonSerializable()
class VBDiResponse extends Equatable {
  @JsonKey(name: 'Data')
  DataVBDiResponse data;

  VBDiResponse(this.data);

  factory VBDiResponse.fromJson(Map<String, dynamic> json) =>
      _$VBDiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VBDiResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
