class ThongKeTuongTac {
  int articleCount = 0;
  int commentCount = 0;
  int likeCount = 0;
  int shareCount = 0;

  ThongKeTuongTac.Empty();

  ThongKeTuongTac(
      {required this.articleCount,
      required this.commentCount,
      required this.likeCount,
      required this.shareCount});

  factory ThongKeTuongTac.fromJson(Map<String, dynamic> json) {
    return ThongKeTuongTac(
        articleCount: json['articleCount'],
        commentCount: json['commentCount'],
        likeCount: json['likeCount'],
        shareCount: json['shareCount']);
  }
}
