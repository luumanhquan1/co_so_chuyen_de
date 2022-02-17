import 'package:ccvc_mobile/domain/model/document/incoming_document.dart';
import 'package:ccvc_mobile/domain/model/quan_ly_van_ban/vb_item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_vb_item.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class DataVanBanResponse extends Equatable {
  @JsonKey(name: 'DoKhan')
  String? doKhan;
  @JsonKey(name: 'LoaiVanBan')
  String? loaiVanBan;
  @JsonKey(name: 'NgayDen_')
  String? ngayDen;
  @JsonKey(name: 'ChuTri')
  String? nguoiSoanThao;

  DataVanBanResponse();

  factory DataVanBanResponse.fromJson(Map<String, dynamic> json) =>
      _$DataVanBanResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataVanBanResponseToJson(this);

  IncomingDocument toDomainVanBan() => IncomingDocument(
        doKhan ??'',
        loaiVanBan??'',
         ngayDen??'',
        nguoiSoanThao??'',
      );

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
