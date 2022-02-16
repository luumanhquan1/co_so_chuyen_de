
import 'package:ccvc_mobile/data/response/quan_ly_van_ban/data_danhsach_vb_response.dart';
import 'package:ccvc_mobile/domain/model/quan_ly_van_ban/page_vb_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ds_vbden_response.g.dart';

@JsonSerializable()
class DanhSachVBDenResponse extends Equatable {
  @JsonKey(name: 'Data')
  List<DanhSachVanBanResponse>? listData;
  DanhSachVBDenResponse();
  factory DanhSachVBDenResponse.fromJson(Map<String, dynamic> json) =>
      _$DanhSachVBDenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DanhSachVBDenResponseToJson(this);
  PageVBModel toDomain() => PageVBModel(
      listBVanBan: listData,);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}