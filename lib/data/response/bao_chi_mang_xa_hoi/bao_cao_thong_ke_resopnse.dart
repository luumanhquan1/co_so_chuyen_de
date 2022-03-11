import 'dart:developer';

import 'package:ccvc_mobile/domain/model/bao_chi_mang_xa_hoi/tat_ca_chu_de/bao_cao_thong_ke.dart';

// part 'bao_cao_thong_ke_resopnse.g.dart';
//
// @JsonSerializable()
// class TuongTacThongKeResponse {
//   @JsonKey(name: 'top_interactions')
//   List<DaTaTuongTacThongKeResponse> danhSachTuongtacThongKe;
//
//   TuongTacThongKeResponse(this.danhSachTuongtacThongKe);
//
//   factory TuongTacThongKeResponse.fromJson(Map<String, dynamic> json) =>
//       _$TuongTacThongKeResponseFromJson(json);
//
//   Map<String, dynamic> toJson() => _$TuongTacThongKeResponseToJson(this);
//
//   TuongTacThongKeResponseModel toDomain() =>
//       TuongTacThongKeResponseModel(
//         danhSachTuongtacThongKe: danhSachTuongtacThongKe.map((e) =>
//             e.toDomain(),).toList(),
//       );
// }
//
// @JsonSerializable()
// class DaTaTuongTacThongKeResponse {
//   @JsonKey(name: 'data')
//   DataTuongTacThongKe dataTuongTacThongKe;
//
//   DaTaTuongTacThongKeResponse(this.dataTuongTacThongKe);
//
//   factory DaTaTuongTacThongKeResponse.fromJson(Map<String, dynamic> json) =>
//       _$DaTaTuongTacThongKeResponseFromJson(json);
//
//   Map<String, dynamic> toJson() => _$DaTaTuongTacThongKeResponseToJson(this);
//
//   DaTaTuongTacThongKeResponseModel toDomain() =>
//       DaTaTuongTacThongKeResponseModel(
//         dataTuongTacThongKeModel: dataTuongTacThongKe.toDomain(),
//       );
// }
//
//
// @JsonSerializable()
// class DataTuongTacThongKe {
//   @JsonKey(name: 'id')
//   int? iD;
//   @JsonKey(name: 'name')
//   String? name;
//   @JsonKey(name: 'interaction_statistic')
//   DataInteractionStatistic? interactionStatistic;
//
//   DataTuongTacThongKe(this.iD, this.name, this.interactionStatistic);
//
//   factory DataTuongTacThongKe.fromJson(Map<String, dynamic> json) =>
//       _$DataTuongTacThongKeFromJson(json);
//
//   Map<String, dynamic> toJson() => _$DataTuongTacThongKeToJson(this);
//
//   DataTuongTacThongKeModel toDomain() =>
//       DataTuongTacThongKeModel(
//         iD: iD,
//         name: name,
//         interactionStatistic: interactionStatistic?.toDomain(),
//       );
// }
//
// @JsonSerializable()
// class DataInteractionStatistic {
//   @JsonKey(name: 'articleCount')
//   int? articleCount;
//   @JsonKey(name: 'likeCount')
//   int? likeCount;
//   @JsonKey(name: 'shareCount')
//   int? shareCount;
//   @JsonKey(name: 'commentCount')
//   int? commentCount;
//
//
//   DataInteractionStatistic({this.articleCount,
//     this.likeCount,
//     this.shareCount,
//     this.commentCount,
//   });
//
//   factory DataInteractionStatistic.fromJson(Map<String, dynamic> json) =>
//       _$DataInteractionStatisticFromJson(json);
//
//   Map<String, dynamic> toJson() => _$DataInteractionStatisticToJson(this);
//
//   InteractionStatisticModel toDomain() =>
//       InteractionStatisticModel(
//         articleCount: articleCount,
//         likeCount: likeCount,
//         shareCount: shareCount,
//         commentCount: commentCount,);
// }

class TuongTacThongKeResponse {
  List<TopInteractions>? topInteractions;

  TuongTacThongKeResponse({this.topInteractions});

  TuongTacThongKeResponse.fromJson(Map<String,dynamic> json) {
    if (json['top_interactions'] != null) {
      print('-----------------------------${json['top_interactions'] }-------------');
      topInteractions = <TopInteractions>[];
      json['top_interactions'].forEach((v) {
        topInteractions!.add(TopInteractions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (topInteractions != null) {
      data['top_interactions'] =
          topInteractions!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  TuongTacThongKeResponseModel toDomain() => TuongTacThongKeResponseModel(
        danhSachTuongtacThongKe:
            topInteractions?.map((e) => e.toDomain()).toList(),
      );
}

class TopInteractions {
  Data? data;

  TopInteractions({this.data});

  TopInteractions.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  TopInteractionModel toDomain() => TopInteractionModel(
        dataTuongTacThongKeModel: data?.toDomain(),
      );
}

class Data {
  int? id;
  String? name;
  InteractionStatistic? interactionStatistic;

  Data({
    this.id,
    this.name,
    this.interactionStatistic,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    interactionStatistic = json['interaction_statistic'] != null
        ? InteractionStatistic.fromJson(json['interaction_statistic'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (interactionStatistic != null) {
      data['interaction_statistic'] = interactionStatistic!.toJson();
    }
    return data;
  }

  DataModel toDomain() => DataModel(
        iD: id ?? 0,
        name: name ?? '',
        interactionStatistic: interactionStatistic?.toDomain(),
      );
}

class InteractionStatistic {
  int? articleCount;
  int? likeCount;
  int? shareCount;
  int? commentCount;

  InteractionStatistic({
    this.articleCount,
    this.likeCount,
    this.shareCount,
    this.commentCount,
  });

  InteractionStatistic.fromJson(Map<String, dynamic> json) {
    articleCount = json['articleCount'];
    likeCount = json['likeCount'];
    shareCount = json['shareCount'];
    commentCount = json['commentCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['articleCount'] = articleCount;
    data['likeCount'] = likeCount;
    data['shareCount'] = shareCount;
    data['commentCount'] = commentCount;
    return data;
  }

  InteractionStatisticModel toDomain() => InteractionStatisticModel(
        articleCount: articleCount ?? 0,
        likeCount: likeCount ?? 0,
        shareCount: shareCount ?? 0,
        commentCount: commentCount ?? 0,
      );
}
