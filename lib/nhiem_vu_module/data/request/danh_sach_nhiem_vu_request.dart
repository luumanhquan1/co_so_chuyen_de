import 'package:json_annotation/json_annotation.dart';

part 'danh_sach_nhiem_vu_request.g.dart';

@JsonSerializable()
class DanhSachNhiemVuRequest {
  @JsonKey(name: 'Index')
  int? index;
  @JsonKey(name: 'IsNhiemVuCaNhan')
  bool? isNhiemVuCaNhan;
  @JsonKey(name: 'IsSortByHanXuLy')
  bool? isSortByHanXuLy;
  @JsonKey(name: 'MangTrangThai')
  List<String>? mangTrangThai;
  @JsonKey(name: 'NgayTaoNhiemVu')
  Map<String, String>? ngayTaoNhiemVu;
  @JsonKey(name: 'Size')
  int? size;

  DanhSachNhiemVuRequest({
    this.index,
    this.isNhiemVuCaNhan,
    this.isSortByHanXuLy,
    this.mangTrangThai,
    this.ngayTaoNhiemVu,
    this.size,
  });

  factory DanhSachNhiemVuRequest.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DanhSachNhiemVuRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DanhSachNhiemVuRequestToJson(this);
}
