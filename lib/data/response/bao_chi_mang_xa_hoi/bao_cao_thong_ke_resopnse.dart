import 'package:ccvc_mobile/domain/model/bao_chi_mang_xa_hoi/tat_ca_chu_de/bao_cao_thong_ke.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bao_cao_thong_ke_resopnse.g.dart';

@JsonSerializable()
class TuongTacThongKeResponse {
  @JsonKey(name: 'top_interactions')
  List<DaTaTuongTacThongKeResponse> danhSachTuongtacThongKe;

  TuongTacThongKeResponse(this.danhSachTuongtacThongKe);

  factory TuongTacThongKeResponse.fromJson(Map<String, dynamic> json) =>
      _$TuongTacThongKeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TuongTacThongKeResponseToJson(this);

  TuongTacThongKeResponseModel toDomain() => TuongTacThongKeResponseModel(
        danhSachTuongtacThongKe:
            danhSachTuongtacThongKe.map((e) => e.toDomain()).toList(),
      );
}

@JsonSerializable()
class DaTaTuongTacThongKeResponse {
  @JsonKey(name: 'data')
  DataTuongTacThongKe dataTuongTacThongKe;

  DaTaTuongTacThongKeResponse(this.dataTuongTacThongKe);

  factory DaTaTuongTacThongKeResponse.fromJson(Map<String, dynamic> json) =>
      _$DaTaTuongTacThongKeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DaTaTuongTacThongKeResponseToJson(this);

  TopInteractionModel toDomain() => TopInteractionModel(
        dataTuongTacThongKeModel: dataTuongTacThongKe.toDomain(),
      );
}

@JsonSerializable()
class DataTuongTacThongKe {
  @JsonKey(name: 'id')
  int? iD;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'interaction_statistic')
  DataInteractionStatistic? interactionStatistic;

  DataTuongTacThongKe(this.iD, this.name, this.interactionStatistic);

  factory DataTuongTacThongKe.fromJson(Map<String, dynamic> json) =>
      _$DataTuongTacThongKeFromJson(json);

  Map<String, dynamic> toJson() => _$DataTuongTacThongKeToJson(this);

  DataModel toDomain() => DataModel(
        iD: iD ?? 0,
        name: name ?? '',
        interactionStatistic: interactionStatistic?.toDomain() ??
            DataInteractionStatistic().toDomain(),
      );
}

@JsonSerializable()
class DataInteractionStatistic {
  @JsonKey(name: 'articleCount')
  int? articleCount;
  @JsonKey(name: 'likeCount')
  int? likeCount;
  @JsonKey(name: 'shareCount')
  int? shareCount;
  @JsonKey(name: 'commentCount')
  int? commentCount;

  DataInteractionStatistic({
    this.articleCount,
    this.likeCount,
    this.shareCount,
    this.commentCount,
  });

  factory DataInteractionStatistic.fromJson(Map<String, dynamic> json) =>
      _$DataInteractionStatisticFromJson(json);

  Map<String, dynamic> toJson() => _$DataInteractionStatisticToJson(this);

  InteractionStatisticModel toDomain() => InteractionStatisticModel(
        articleCount: articleCount ?? 0,
        likeCount: likeCount ?? 0,
        shareCount: shareCount ?? 0,
        commentCount: commentCount ?? 0,
      );
}
