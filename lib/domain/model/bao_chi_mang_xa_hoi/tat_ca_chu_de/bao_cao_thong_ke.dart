class InteractionStatisticModel {
  int articleCount;
  int likeCount;
  int shareCount;
  int commentCount;

  InteractionStatisticModel({
    required this.articleCount,
    required this.likeCount,
    required this.shareCount,
    required this.commentCount,
  });
}

class DataModel {
  int iD;
  String name;
  InteractionStatisticModel interactionStatistic;

  DataModel({
    required this.iD,
    required this.name,
    required this.interactionStatistic,
  });
}

class TopInteractionModel {
  DataModel dataTuongTacThongKeModel;

  TopInteractionModel({required this.dataTuongTacThongKeModel});
}

class TuongTacThongKeResponseModel {
  List<TopInteractionModel> danhSachTuongtacThongKe;

  TuongTacThongKeResponseModel({required this.danhSachTuongtacThongKe});
}
