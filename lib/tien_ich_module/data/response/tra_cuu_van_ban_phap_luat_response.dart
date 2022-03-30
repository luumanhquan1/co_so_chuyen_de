import 'package:ccvc_mobile/tien_ich_module/domain/model/tra_cuu_van_ban_phap_luat_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tra_cuu_van_ban_phap_luat_response.g.dart';

@JsonSerializable()
class DataTraCuuVanBanPhapLuatResponse extends Equatable {
  @JsonKey(name: 'data')
  PageTraCuuVanBanPhapLuatResponse? data;
  @JsonKey(name: 'statusCode')
  int? statusCode;
  @JsonKey(name: 'succeeded')
  bool? succeeded;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'message')
  String? message;

  DataTraCuuVanBanPhapLuatResponse({
    this.data,
    this.statusCode,
    this.succeeded,
    this.code,
    this.message,
  });

  factory DataTraCuuVanBanPhapLuatResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DataTraCuuVanBanPhapLuatResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DataTraCuuVanBanPhapLuatResponseToJson(this);

  //todo convert to Model to use
  @override
  List<Object?> get props => [];
}

@JsonSerializable()
class PageTraCuuVanBanPhapLuatResponse extends Equatable {
  @JsonKey(name: 'items')
  List<TraCuuVanBanPhapLuatResponse>? items;
  @JsonKey(name: 'pageIndex')
  int? pageIndex;
  @JsonKey(name: 'pageSize')
  int? pageSize;
  @JsonKey(name: 'totalCount')
  int? totalCount;
  @JsonKey(name: 'totalPage')
  int? totalPage;

  PageTraCuuVanBanPhapLuatResponse({
    this.items,
    this.pageIndex,
    this.pageSize,
    this.totalCount,
    this.totalPage,
  });

  factory PageTraCuuVanBanPhapLuatResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PageTraCuuVanBanPhapLuatResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PageTraCuuVanBanPhapLuatResponseToJson(this);

  PageTraCuuVanBanPhapLuatModel toModel() => PageTraCuuVanBanPhapLuatModel(
        items: items?.map((e) => e.toModel()).toList() ?? [],
        pageIndex: pageIndex,
        pageSize: pageSize,
        totalCount: totalCount,
        totalPage: totalPage,
      );

  //todo convert to Model to use
  @override
  List<Object?> get props => [];
}

@JsonSerializable()
class TraCuuVanBanPhapLuatResponse extends Equatable {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'url')
  String? url;
  @JsonKey(name: 'day')
  String? day;

  TraCuuVanBanPhapLuatResponse({
    this.id,
    this.title,
    this.url,
    this.day,
  });

  factory TraCuuVanBanPhapLuatResponse.fromJson(Map<String, dynamic> json) =>
      _$TraCuuVanBanPhapLuatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TraCuuVanBanPhapLuatResponseToJson(this);

  TraCuuVanBanPhapLuatModel toModel() => TraCuuVanBanPhapLuatModel(
        id: id,
        title: title,
        url: url,
        day: day,
      );

  //todo convert to Model to use
  @override
  List<Object?> get props => [];
}
