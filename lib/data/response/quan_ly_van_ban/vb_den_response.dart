import 'package:ccvc_mobile/data/response/quan_ly_van_ban/data_vbden_response.dart';
import 'package:ccvc_mobile/domain/model/quan_ly_van_ban/vbden_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vb_den_response.g.dart';

@JsonSerializable()
class VBDenResponse extends Equatable {
  @JsonKey(name: 'Data')
  List<DataVBDenResponse>? data;
  VBDenResponse();
  factory VBDenResponse.fromJson(Map<String, dynamic> json) =>
      _$VBDenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VBDenResponseToJson(this);
  VBDenModel toDomain() => VBDenModel(listVBDen: data);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
