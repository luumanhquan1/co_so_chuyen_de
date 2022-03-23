import 'package:ccvc_mobile/data/response/chi_tiet_van_ban/lich_su_thu_hoi_van_ban_di_response.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/lich_su_ky_duyet_van_ban_di_model.dart';
import 'package:ccvc_mobile/tien_ich_module/utils/extensions/date_time_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lich_su_ky_duyet_van_ban_di_response.g.dart';

@JsonSerializable()
class DataLichSuKyDuyetVanBanDiResponse extends Equatable {
  @JsonKey(name: 'Messages')
  String? messages;
  @JsonKey(name: 'Data')
  List<LichSuKyDuyetVanBanDiResponse>? data;
  @JsonKey(name: 'ValidationResult')
  String? validationResult;
  @JsonKey(name: 'IsSuccess')
  bool? isSuccess;

  DataLichSuKyDuyetVanBanDiResponse({
    this.messages,
    this.data,
    this.validationResult,
    this.isSuccess,
  });

  factory DataLichSuKyDuyetVanBanDiResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DataLichSuKyDuyetVanBanDiResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DataLichSuKyDuyetVanBanDiResponseToJson(this);

  DataLichSuKyDuyetVanBanDi toModel() => DataLichSuKyDuyetVanBanDi(
        messages: messages,
        data: data?.map((e) => e.toModel()).toList() ?? [],
        validationResult: validationResult,
        isSuccess: isSuccess,
      );

  //todo convert to Model to use
  @override
  List<Object?> get props => [];
}

@JsonSerializable()
class LichSuKyDuyetVanBanDiResponse extends Equatable {
  @JsonKey(name: 'NguoiGui')
  String? nguoiGui;
  @JsonKey(name: 'DonViGui')
  String? donViGui;
  @JsonKey(name: 'ThoiGian')
  String? thoiGian;
  @JsonKey(name: 'NguoiNhan')
  String? nguoiNhan;
  @JsonKey(name: 'DonViNhan')
  String? donViNhan;
  @JsonKey(name: 'Action')
  int? action;
  @JsonKey(name: 'NoiDungCapNhat')
  String? noiDungCapNhat;
  @JsonKey(name: 'Files')
  List<FilesResponse>? files;

  LichSuKyDuyetVanBanDiResponse({
    this.nguoiGui,
    this.donViGui,
    this.thoiGian,
    this.nguoiNhan,
    this.donViNhan,
    this.action,
    this.noiDungCapNhat,
    this.files,
  });

  factory LichSuKyDuyetVanBanDiResponse.fromJson(Map<String, dynamic> json) =>
      _$LichSuKyDuyetVanBanDiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LichSuKyDuyetVanBanDiResponseToJson(this);

  LichSuKyDuyetVanBanDi toModel() => LichSuKyDuyetVanBanDi(
        nguoiGui: nguoiGui,
        donViGui: donViGui,
        thoiGian: DateTime.parse(thoiGian ?? '').formatApiLichSu,
        nguoiNhan: nguoiNhan,
        donViNhan: donViNhan,
        action: action,
        noiDungCapNhat: noiDungCapNhat?.parseHtml(),
        files: files?.map((e) => e.toModel()).toList() ?? [],
      );

  //todo convert to Model to use
  @override
  List<Object?> get props => [];
}
