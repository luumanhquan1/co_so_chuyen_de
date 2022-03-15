
class TinTucThoiSuResponseModel{
  final List<TinTucThoiSuModel>listTinTucThoiSu;
  TinTucThoiSuResponseModel({required this.listTinTucThoiSu});
}

class TinTucThoiSuModel {
  final String title;
  final String content;
  final String publishedTime;
  final String audioUrl;
  final double audioDuration;

  TinTucThoiSuModel(
      {required this.title,
      required this.content,
      required this.publishedTime,
      required this.audioUrl,
      required this.audioDuration,});
}
