class ChuDeModel {
  String? id;
  String? title;
  String? link;
  String? avartar;
  String? url;
  String? addressId;
  String? syncDate;

  ChuDeModel({
    this.id,
    this.title,
    this.link,
    this.avartar,
    this.url,
    this.addressId,
    this.syncDate,
  });
}

class ListChuDeModel{
  List<ChuDeModel>? getlistChuDe;
  ListChuDeModel({this.getlistChuDe});
}
