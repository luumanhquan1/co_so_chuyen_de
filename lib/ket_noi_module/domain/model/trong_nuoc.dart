class TrongNuocModel {
  bool? hasNextPage;
  bool? hasPreviousPage;
  List<ItemTrongNuocModel>? pageData;
  int? pageIndex;
  int? totalIndex;
  int? totalItems;
  int? totalPages;

  TrongNuocModel({
    required this.hasNextPage,
    required this.hasPreviousPage,
    required this.pageData,
    required this.pageIndex,
    required this.totalIndex,
    required this.totalItems,
    required this.totalPages,
  });
}

class ItemTrongNuocModel {
  String? category;
  String? categoryTitle;
  String? diaChi;
  String? email;
  String? fax;
  String? id;
  String? imageUrlPath;
  String? sdt;
  String? tenCoQuanLienHe;

  ItemTrongNuocModel({
    required this.category,
    required this.categoryTitle,
    required this.diaChi,
    required this.email,
    required this.fax,
    required this.id,
    required this.imageUrlPath,
    required this.sdt,
    required this.tenCoQuanLienHe,
  });
}
