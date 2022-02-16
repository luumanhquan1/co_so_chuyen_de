import 'package:ccvc_mobile/data/response/quan_ly_van_ban/data_vb_item.dart';
import 'package:ccvc_mobile/data/response/quan_ly_van_ban/data_vb_item.dart';
import 'package:ccvc_mobile/domain/model/quan_ly_van_ban/vb_item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_page_danhsach_response.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class DataDanhSachVanBanResponse extends Equatable {
  @JsonKey(name: 'PageData')
  List<DataVanBanResponse>? listVanBan;
  DataDanhSachVanBanResponse();

  factory DataDanhSachVanBanResponse.fromJson(Map<String, dynamic> json) =>
      _$DataDanhSachVanBanResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataDanhSachVanBanResponseToJson(this);

  DanhSachVanBanModel toDomainDanhSachVanBan() => DanhSachVanBanModel(
      listVB: listVanBan,
  );

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
