class TinhHuongKhanCapModel {
  String id = '';
  bool isLink = false;
  String? linkOrContent;
  String title = '';

  TinhHuongKhanCapModel({
    required this.id,
    required this.isLink,
    this.linkOrContent,
    required this.title,
  });
}
