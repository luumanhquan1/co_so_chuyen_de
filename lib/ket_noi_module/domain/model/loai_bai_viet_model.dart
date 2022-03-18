class LoaiBaiVietModel {
  List<Childrens>? childrens;
  String? id;
  String? title;
  String? code;
  String? alias;
  String? description;
  String? thumbnailUrl;
  String? parentId;
  String? pathItem;
  bool? isDuocMoi;
  String? type;
  int? order;

  LoaiBaiVietModel({
    this.childrens,
    this.id,
    this.title,
    this.code,
    this.alias,
    this.description,
    this.thumbnailUrl,
    this.parentId,
    this.pathItem,
    this.isDuocMoi,
    this.type,
    this.order,
  });
}

class Childrens {
  List<ChildrensSon>? childrens;
  String? id;
  String? title;
  String? code;
  String? alias;
  String? description;
  String? thumbnailUrl;
  String? parentId;
  String? pathItem;
  bool? isDuocMoi;
  String? type;
  int? order;

  Childrens({
    this.childrens,
    this.id,
    this.title,
    this.code,
    this.alias,
    this.description,
    this.thumbnailUrl,
    this.parentId,
    this.pathItem,
    this.isDuocMoi,
    this.type,
    this.order,
  });
}

class ChildrensSon {
  List<String>? childrens;
  String? id;
  String? title;
  String? code;
  String? alias;
  String? description;
  String? thumbnailUrl;
  String? parentId;
  String? pathItem;
  bool? isDuocMoi;
  String? type;
  int? order;

  ChildrensSon({
    this.childrens,
    this.id,
    this.title,
    this.code,
    this.alias,
    this.description,
    this.thumbnailUrl,
    this.parentId,
    this.pathItem,
    this.isDuocMoi,
    this.type,
    this.order,
  });
}
