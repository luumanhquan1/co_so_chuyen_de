import 'package:ccvc_mobile/domain/model/account/data_user.dart';
import 'package:ccvc_mobile/domain/model/account/user_infomation.dart';
import 'package:ccvc_mobile/domain/model/quan_ly_van_ban/vbdi_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_qlvb_response.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class DataVBDiResponse extends Equatable {
  @JsonKey(name: 'SoLuongChoTrinhKy')
  int? soLuongChoTrinhKy;
  @JsonKey(name: 'SoLuongChoXuLy')
  int? soLuongChoXuLy;
  @JsonKey(name: 'SoLuongDaXuLy')
  int? soLuongDaXuLy;
  @JsonKey(name: 'SoLuongThuongKhan')
  int? soLuongThuongKhan;
  DataVBDiResponse();

  factory DataVBDiResponse.fromJson(Map<String, dynamic> json) =>
      _$DataVBDiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataVBDiResponseToJson(this);

  VBDiModel toDomainVBDi() => VBDiModel(
    soLuongChoTrinhKy: soLuongChoTrinhKy,
    soLuongChoXuLy: soLuongChoXuLy,
    soLuongDaXuLy: soLuongDaXuLy,
    soLuongThuongKhan: soLuongThuongKhan,
  );
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


