

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class DetailCalenderWorkResponse extends Equatable {
  @JsonKey(name: 'data' )
  DetailCalenderWorkResponseData data;

  DetailCalenderWorkResponse(this.data);

  factory DetailCalenderWorkResponse.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$DetailCalenderWorkResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailCalenderWorkResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}