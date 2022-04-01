class LoaiBaiVietModel {
  List<LoaiBaiVietModel> childrens;
  String id;
  String title;
  String code;
  String alias;
  String description;
  String thumbnailUrl;
  String parentId;
  String pathItem;
  bool isDuocMoi;
  String type;
  int order;
  bool? isSelect;

  LoaiBaiVietModel({
    required this.childrens,
    required this.id,
    required this.title,
    required this.code,
    required this.alias,
    required this.description,
    required this.thumbnailUrl,
    required this.parentId,
    required this.pathItem,
    required this.isDuocMoi,
    required this.type,
    required this.order,
  });
}
