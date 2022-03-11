class InteractionStatisticModel {
  int? articleCount;
  int? likeCount;
  int? shareCount;
  int? commentCount;

  InteractionStatisticModel({
    this.articleCount,
    this.likeCount,
    this.shareCount,
    this.commentCount,
  });
}

class DataModel {
  int? iD;
  String? name;
  InteractionStatisticModel? interactionStatistic;
  DataModel({this.iD, this.name, this.interactionStatistic});
}
class TopInteractionModel{
  DataModel? dataTuongTacThongKeModel;
  TopInteractionModel({this.dataTuongTacThongKeModel});
}
class TuongTacThongKeResponseModel{
  List<TopInteractionModel>? danhSachTuongtacThongKe;
  TuongTacThongKeResponseModel({this.danhSachTuongtacThongKe});
}
