class ChuDeModel {
  String? id;
  String? title;
  String? link;
  String? avartar;
  String? url;
  String? addressId;
  String? publishedTime;
  String? contents;


  ChuDeModel({
    this.id,
    this.title,
    this.link,
    this.avartar,
    this.url,
    this.addressId,
    this.publishedTime,
    this.contents,
  });
}

class ListChuDeModel{
  List<ChuDeModel>? getlistChuDe;
  ListChuDeModel({this.getlistChuDe});
}
