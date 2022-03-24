import 'package:ccvc_mobile/data/response/chi_tiet_van_ban/lich_su_thu_hoi_van_ban_di_response.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/lich_su_huy_duyet_van_ban_di.dart';
import 'package:ccvc_mobile/tien_ich_module/utils/extensions/date_time_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lich_su_huy_duyet_van_ban_di_response.g.dart';

@JsonSerializable()
class DataLichSuHuyDuyetVanBanDiResponse extends Equatable {
  @JsonKey(name: 'Messages')
  String? messages;
  @JsonKey(name: 'Data')
  List<LichSuHuyDuyetVanBanDiResponse>? data;
  @JsonKey(name: 'ValidationResult')
  String? validationResult;
  @JsonKey(name: 'IsSuccess')
  bool? isSuccess;

  DataLichSuHuyDuyetVanBanDiResponse({
    this.messages,
    this.data,
    this.validationResult,
    this.isSuccess,
  });

  factory DataLichSuHuyDuyetVanBanDiResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DataLichSuHuyDuyetVanBanDiResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DataLichSuHuyDuyetVanBanDiResponseToJson(this);

  DataLichSuHuyDuyetVanBanDi toModel() => DataLichSuHuyDuyetVanBanDi(
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
class LichSuHuyDuyetVanBanDiResponse extends Equatable {
  @JsonKey(name: 'CanBo')
  String? canBo;
  @JsonKey(name: 'DonVi')
  String? donVi;
  @JsonKey(name: 'ThoiGian')
  String? thoiGian;
  @JsonKey(name: 'NoiDungCapNhat')
  String? noiDungCapNhat;
  @JsonKey(name: 'Files')
  List<FilesResponse>? files;

  LichSuHuyDuyetVanBanDiResponse({
    this.canBo,
    this.donVi,
    this.thoiGian,
    this.noiDungCapNhat,
    this.files,
  });

  factory LichSuHuyDuyetVanBanDiResponse.fromJson(Map<String, dynamic> json) =>
      _$LichSuHuyDuyetVanBanDiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LichSuHuyDuyetVanBanDiResponseToJson(this);

  LichSuHuyDuyetVanBanDi toModel() => LichSuHuyDuyetVanBanDi(
        canBo: canBo,
        donVi: donVi,
        thoiGian: DateTime.parse(thoiGian ?? '').formatApiLichSu,
        noiDungCapNhat: noiDungCapNhat?.parseHtml(),
        files: files?.map((e) => e.toModel()).toList() ?? [],
      );

  //todo convert to Model to use
  @override
  List<Object?> get props => [];
}
