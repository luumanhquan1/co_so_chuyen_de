import 'package:ccvc_mobile/tien_ich_module/domain/model/xoa_danh_ba_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'xoa_danh_ba_reponse.g.dart';

@JsonSerializable()
class XoaDanhBaResponse extends Equatable {
  @JsonKey(name: 'data')
  String? data;
  @JsonKey(name: 'statusCode')
  int? statusCode;
  @JsonKey(name: 'succeeded')
  bool? succeeded;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'message')
  String? message;

  XoaDanhBaResponse(
      {this.data, this.statusCode, this.succeeded, this.code, this.message});

  factory XoaDanhBaResponse.fromJson(Map<String, dynamic> json) =>
      _$XoaDanhBaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$XoaDanhBaResponseToJson(this);

  //todo convert to Model to use
  @override
  List<Object?> get props => [];

  XoaDanhBaModel toDomain() => XoaDanhBaModel(
      data: data,
      statusCode: statusCode,
      succeeded: succeeded,
      code: code,
      message: message);
}
