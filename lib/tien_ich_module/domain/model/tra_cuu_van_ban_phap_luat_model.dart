class PageTraCuuVanBanPhapLuatModel {
  List<TraCuuVanBanPhapLuatModel>? items;
  int? pageIndex;
  int? pageSize;
  int? totalCount;
  int? totalPage;

  PageTraCuuVanBanPhapLuatModel({
    this.items,
    this.pageIndex,
    this.pageSize,
    this.totalCount,
    this.totalPage,
  });
}

class TraCuuVanBanPhapLuatModel {
  String? id;
  String? title;
  String? url;
  String? day;

  TraCuuVanBanPhapLuatModel({
    this.id,
    this.title,
    this.url,
    this.day,
  });
}
