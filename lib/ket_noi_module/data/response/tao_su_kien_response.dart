import 'package:ccvc_mobile/ket_noi_module/domain/model/tao_su_kien_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tao_su_kien_response.g.dart';

@JsonSerializable()
class TaoSuKienResponse {
  @JsonKey(name: 'data')
  bool? data;

  TaoSuKienResponse();

  factory TaoSuKienResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$TaoSuKienResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TaoSuKienResponseToJson(this);

  TaoSuKienModel toDoMain() => TaoSuKienModel(data: data);
}
