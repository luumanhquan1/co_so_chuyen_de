
class TinTucRadioResponseModel{
  final List<TinTucRadioModel>listTinTucThoiSu;
  TinTucRadioResponseModel({required this.listTinTucThoiSu});
}

class TinTucRadioModel {
  final String title;
  final String content;
  final String publishedTime;
  final String audioUrl;
  final double audioDuration;

  TinTucRadioModel(
      {required this.title,
      required this.content,
      required this.publishedTime,
      required this.audioUrl,
      required this.audioDuration,});
}
