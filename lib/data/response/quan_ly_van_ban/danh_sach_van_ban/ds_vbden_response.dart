import 'package:ccvc_mobile/domain/model/quan_ly_van_ban/van_ban_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ds_vbden_response.g.dart';

@JsonSerializable()
class DanhSachVBDenResponse {
  @JsonKey(name: 'Data')
  DataResponseVBDen danhSachVB;

  DanhSachVBDenResponse(this.danhSachVB);

  factory DanhSachVBDenResponse.fromJson(Map<String, dynamic> json) =>
      _$DanhSachVBDenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DanhSachVBDenResponseToJson(this);
}

@JsonSerializable()
class DataResponseVBDen {
  @JsonKey(name: 'PageData')
  List<PageDataResponseVBDen> pageData;

  DataResponseVBDen(
    this.pageData,
  );

  factory DataResponseVBDen.fromJson(Map<String, dynamic> json) =>
      _$DataResponseVBDenFromJson(json);

  Map<String, dynamic> toJson() => _$DataResponseVBDenToJson(this);

  DanhSachVanBanModel toDomain() => DanhSachVanBanModel(
        pageData: pageData
            .map((e) => VanBanModel(
                doKhan: e.doKhan,
                loaiVanBan: e.loaiVanBan,
                ngayDen: e.ngayDen,
                iD: e.iD,
                nguoiSoanThao: e.nguoiSoanThao,),)
            .toList(),
      );
}

@JsonSerializable()
class PageDataResponseVBDen {
  @JsonKey(name: 'DoKhan')
  String? doKhan;
  @JsonKey(name: 'LoaiVanBan')
  String? loaiVanBan;
  @JsonKey(name: 'NgayDen_')
  String? ngayDen;
  @JsonKey(name: 'ChuTri')
  String? nguoiSoanThao;
  @JsonKey(name: 'Id')
  String? iD;

  PageDataResponseVBDen(
      this.iD,this.doKhan, this.loaiVanBan, this.ngayDen, this.nguoiSoanThao,);

  factory PageDataResponseVBDen.fromJson(Map<String, dynamic> json) =>
      _$PageDataResponseVBDenFromJson(json);

  Map<String, dynamic> toJson() => _$PageDataResponseVBDenToJson(this);

  VanBanModel toDomain() => VanBanModel(
        iD: iD,
        nguoiSoanThao: nguoiSoanThao,
        loaiVanBan: loaiVanBan,
        doKhan: doKhan,
        ngayDen: ngayDen,
      );
}
