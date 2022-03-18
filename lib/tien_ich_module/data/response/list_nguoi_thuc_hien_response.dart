import 'package:ccvc_mobile/domain/model/lich_hop/chon_bien_ban_cuoc_hop.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/nguoi_thuc_hien_model.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/nguoi_thuc_hien_model.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_nguoi_thuc_hien_response.g.dart';

@JsonSerializable()
class ListNguoiThucHienResponse {
  @JsonKey(name: 'data')
  DataListNguoiThucHienResponse data;

  ListNguoiThucHienResponse(this.data);

  factory ListNguoiThucHienResponse.fromJson(Map<String, dynamic> json) =>
      _$ListNguoiThucHienResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListNguoiThucHienResponseToJson(this);
}

@JsonSerializable()
class DataListNguoiThucHienResponse {
  @JsonKey(name: 'items')
  List<ItemsResponseNguoiThucHien>? items;
  @JsonKey(name: 'pageIndex')
  int? pageIndex;
  @JsonKey(name: 'pageSize')
  int? pageSize;
  @JsonKey(name: 'totalCount')
  int? totalCount;
  @JsonKey(name: 'totalPage')
  int? totalPage;

  DataListNguoiThucHienResponse(
    this.items,
    this.pageIndex,
    this.pageSize,
    this.totalCount,
    this.totalPage,
  );

  factory DataListNguoiThucHienResponse.fromJson(Map<String, dynamic> json) =>
      _$DataListNguoiThucHienResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataListNguoiThucHienResponseToJson(this);

  ItemChonBienBanCuocHopModel toDomain() => ItemChonBienBanCuocHopModel(
        items: items?.map((e) => e.toModel()).toList() ?? [],
        pageIndex: pageIndex,
        pageSize: pageSize,
        totalCount: totalCount,
        totalPage: totalPage,
      );
}

@JsonSerializable()
class ItemsResponseNguoiThucHien {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'hoten')
  String? hoten;
  @JsonKey(name: 'donVi')
  List<String>? donVi;
  @JsonKey(name: 'chucVu')
  List<String>? chucVu;

  ItemsResponseNguoiThucHien({
    this.id,
    this.hoten,
    this.donVi,
    this.chucVu,
  });

  factory ItemsResponseNguoiThucHien.fromJson(Map<String, dynamic> json) =>
      _$ItemsResponseNguoiThucHienFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsResponseNguoiThucHienToJson(this);

  NguoiThucHienModel toModel() => NguoiThucHienModel(
        id: id ?? '',
        hoten: hoten ?? '',
        donVi: donVi ?? [],
        chucVu: chucVu ?? [],
      );
}
