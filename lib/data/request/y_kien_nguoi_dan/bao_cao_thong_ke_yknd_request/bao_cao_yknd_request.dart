import 'package:json_annotation/json_annotation.dart';

part 'bao_cao_yknd_request.g.dart';

@JsonSerializable()
class BaoCaoYKNDRequest {
  @JsonKey(name: 'DenNgay')
  final String denNgay;
  @JsonKey(name: 'TuNgay')
  final String? tuNgay;
  BaoCaoYKNDRequest({
    required this.denNgay,
    required this.tuNgay,
  });

  factory BaoCaoYKNDRequest.fromJson(Map<String, dynamic> json) =>
      _$BaoCaoYKNDRequestFromJson(json);
  Map<String, dynamic> toJson() => _$BaoCaoYKNDRequestToJson(this);
}

@JsonSerializable()
class DashBoardBaoCaoYKNDRequest {
  @JsonKey(name: 'DenNgay')
  final String denNgay;
  @JsonKey(name: 'TuNgay')
  final String? tuNgay;
  DashBoardBaoCaoYKNDRequest({
    required this.denNgay,
    required this.tuNgay,
  });

  factory DashBoardBaoCaoYKNDRequest.fromJson(Map<String, dynamic> json) =>
      _$DashBoardBaoCaoYKNDRequestFromJson(json);
  Map<String, dynamic> toJson() => _$DashBoardBaoCaoYKNDRequestToJson(this);
}

@JsonSerializable()
class LinhVucKhacRequest {
  @JsonKey(name: 'DenNgay')
  final String denNgay;
  @JsonKey(name: 'TuNgay')
  final String? tuNgay;
  LinhVucKhacRequest({
    required this.denNgay,
    required this.tuNgay,
  });

  factory LinhVucKhacRequest.fromJson(Map<String, dynamic> json) =>
      _$LinhVucKhacRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LinhVucKhacRequestToJson(this);
}
@JsonSerializable()
class DonViXuLyRequest {
  @JsonKey(name: 'DenNgay')
  final String denNgay;
  @JsonKey(name: 'TuNgay')
  final String? tuNgay;
  DonViXuLyRequest({
    required this.denNgay,
    required this.tuNgay,
  });

  factory DonViXuLyRequest.fromJson(Map<String, dynamic> json) =>
      _$DonViXuLyRequestFromJson(json);
  Map<String, dynamic> toJson() => _$DonViXuLyRequestToJson(this);
}

@JsonSerializable()
class SoLuongByMonthRequest {
  @JsonKey(name: 'DenNgay')
  final String denNgay;
  @JsonKey(name: 'TuNgay')
  final String? tuNgay;
  SoLuongByMonthRequest({
    required this.denNgay,
    required this.tuNgay,
  });

  factory SoLuongByMonthRequest.fromJson(Map<String, dynamic> json) =>
      _$SoLuongByMonthRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SoLuongByMonthRequestToJson(this);
}