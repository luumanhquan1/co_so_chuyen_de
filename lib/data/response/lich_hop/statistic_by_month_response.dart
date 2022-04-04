import 'package:ccvc_mobile/domain/model/lich_hop/thong_ke_lich_hop/statistic_by_month_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'statistic_by_month_response.g.dart';

@JsonSerializable()
class StatisticByMonthResponse extends Equatable {
  @JsonKey(name: 'data')
  List<StatisticByMonthData> data;
  @JsonKey(name: 'statusCode')
  int? statusCode;
  @JsonKey(name: 'succeeded')
  bool? succeeded;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'message')
  String? message;

  StatisticByMonthResponse(
    this.data,
    this.statusCode,
    this.succeeded,
    this.code,
    this.message,
  );

  factory StatisticByMonthResponse.fromJson(Map<String, dynamic> json) =>
      _$StatisticByMonthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticByMonthResponseToJson(this);

  @override
  List<Object?> get props => [];
}

@JsonSerializable()
class StatisticByMonthData extends Equatable {
  @JsonKey(name: 'month')
  int? month;
  @JsonKey(name: 'quantities')
  int? quantities;

  StatisticByMonthData({required this.month, required this.quantities});

  StatisticByMonthModel toModel() =>
      StatisticByMonthModel(month: month, quantities: quantities);

  factory StatisticByMonthData.fromJson(Map<String, dynamic> json) =>
      _$StatisticByMonthDataFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticByMonthDataToJson(this);

  @override
  List<Object?> get props => [];
}
