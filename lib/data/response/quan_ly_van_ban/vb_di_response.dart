import 'package:ccvc_mobile/domain/model/quan_ly_van_ban/vbdi_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vb_di_response.g.dart';

@JsonSerializable()
class VBDiResponse extends Equatable {
  @JsonKey(name: 'soLuongChoTrinhKy')
  int? soLuongChoTrinhKy;
  @JsonKey(name: 'soLuongChoXuLy')
  int? soLuongChoXuLy;
  @JsonKey(name: 'soLuongDaXuLy')
  int? soLuongDaXuLy;
  @JsonKey(name: 'soLuongThuongKhan')
  int? soLuongThuongKhan;

  VBDiResponse();

  factory VBDiResponse.fromJson(Map<String, dynamic> json) =>
      _$VBDiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VBDiResponseToJson(this);

  VBDiModel toDomain() => VBDiModel(
      soLuongChoTrinhKy: soLuongChoTrinhKy,
      soLuongChoXuLy: soLuongChoXuLy,
      soLuongDaXuLy: soLuongDaXuLy,
      soLuongThuongKhan: soLuongThuongKhan,
      );

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
