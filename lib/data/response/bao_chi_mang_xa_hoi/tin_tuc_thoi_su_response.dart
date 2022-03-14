import 'dart:core';

import 'package:ccvc_mobile/domain/model/bao_chi_mang_xa_hoi/menu_bcmxh.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tin_tuc_thoi_su_response.g.dart';
@JsonSerializable()
class TinTucThoiSuResponse {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'title')
  String? title;

  TinTucThoiSuResponse(this.id, this.title);

  factory TinTucThoiSuResponse.fromJson(Map<String, dynamic> json) =>
      _$TinTucThoiSuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TinTucThoiSuResponseToJson(this);

  // ListMenuItemModel toDomain() => ListMenuItemModel(
  //   id: id ?? '',
  //   title: title ?? '',
  //   subMenu: subMenu?.map((e) => e.toDomain()).toList() ?? [],
  // );
}


