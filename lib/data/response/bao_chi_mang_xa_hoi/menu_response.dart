import 'dart:core';

import 'package:ccvc_mobile/domain/model/bao_chi_mang_xa_hoi/menu_bcmxh.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menu_response.g.dart';

@JsonSerializable()
class MenuResponse {
  List<LitsMenuItem>? listMenuItem;

  MenuResponse(this.listMenuItem);

  factory MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MenuResponseToJson(this);

  MenuModel toDomain() =>
      MenuModel(listData: listMenuItem?.map((e) => e.toDomain()).toList());
}

@JsonSerializable()
class LitsMenuItem {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'submenu')
  List<MenuData>? subMenu;

  LitsMenuItem(this.id, this.title, this.subMenu);

  factory LitsMenuItem.fromJson(Map<String, dynamic> json) =>
      _$LitsMenuItemFromJson(json);

  Map<String, dynamic> toJson() => _$LitsMenuItemToJson(this);

  ListMenuItemModel toDomain() => ListMenuItemModel(
        id: id,
        title: title,
        subMenu: subMenu?.map((e) => e.toDomain()).toList(),
      );
}

@JsonSerializable()
class MenuData {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'nodeid')
  String? nodeId;
  @JsonKey(name: 'title')
  String? title;

  MenuData({
    this.id,
    this.nodeId,
    this.title,
  });

  factory MenuData.fromJson(Map<String, dynamic> json) =>
      _$MenuDataFromJson(json);

  Map<String, dynamic> toJson() => _$MenuDataToJson(this);

  MenuItemModel toDomain() => MenuItemModel(
        id: id,
        nodeId: nodeId,
        title: title,
      );
}
