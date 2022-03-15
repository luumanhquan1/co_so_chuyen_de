class DetailHuongDanSuDung {
  String? content;
  String? topic;
  String? type;
  String? id;
  String? title;
  String? order;
  bool?   inUsed;
  bool?   isDeleted;
  String? createdOn;
  String? createdBy;
  String? updatedOn;
  String? updatedBy;

  DetailHuongDanSuDung({
    this.content,
    this.topic,
    this.type,
    this.id,
    this.title,
    this.order,
    this.inUsed,
    this.isDeleted,
    this.createdOn,
    this.createdBy,
    this.updatedOn,
    this.updatedBy,
  });
}
String addDomainImage(String content){
  return content.replaceAll('src="/', 'src="http://api-ccvc.dongnai.edsolabs.vn/');
}
