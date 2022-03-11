class TopicHDSD {
  String? maTopic;
  String? icon;
  String? id;
  String? title;
  int?    order;
  bool?   inUsed;
  bool?   isDeleted;
  String? createdOn;
  String? createdBy;
  String? updatedOn;
  String? updatedBy;

  TopicHDSD({
    this.maTopic,
    this.icon,
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

  TopicHDSD.empty();
}
