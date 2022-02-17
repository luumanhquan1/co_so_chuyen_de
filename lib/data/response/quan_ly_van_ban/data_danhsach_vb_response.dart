import 'package:ccvc_mobile/data/response/quan_ly_van_ban/data_vb_item.dart';
import 'package:ccvc_mobile/domain/model/quan_ly_van_ban/vb_item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'data_danhsach_vb_response.g.dart';


@JsonSerializable()
// ignore: must_be_immutable
class DanhSachVanBanResponse extends Equatable {
  @JsonKey(name: 'PageData')
  List<DataVanBanResponse>? danhSachVB;
  DanhSachVanBanResponse();

  factory DanhSachVanBanResponse.fromJson(Map<String, dynamic> json) =>
      _$DanhSachVanBanResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DanhSachVanBanResponseToJson(this);

  DanhSachVanBanModel toDomainVanBan() => DanhSachVanBanModel(
     listVB: danhSachVB,
  );

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
