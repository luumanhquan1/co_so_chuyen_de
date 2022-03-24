import 'package:ccvc_mobile/data/response/chi_tiet_van_ban/lich_su_thu_hoi_van_ban_di_response.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/lich_su_tra_lai_van_ban_di_model.dart';
import 'package:ccvc_mobile/tien_ich_module/utils/extensions/date_time_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lich_su_tra_lai_van_ban_di_response.g.dart';

@JsonSerializable()
class DataLichSuTraLaiVanBanDiResponse extends Equatable {
  @JsonKey(name: 'Messages')
  String? messages;
  @JsonKey(name: 'Data')
  List<LichSuTraLaiVanBanDiResponse>? data;
  @JsonKey(name: 'ValidationResult')
  String? validationResult;
  @JsonKey(name: 'IsSuccess')
  bool? isSuccess;

  DataLichSuTraLaiVanBanDiResponse({
    this.messages,
    this.data,
    this.validationResult,
    this.isSuccess,
  });

  factory DataLichSuTraLaiVanBanDiResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DataLichSuTraLaiVanBanDiResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DataLichSuTraLaiVanBanDiResponseToJson(this);

  DataLichSuTraLaiVanBanDi toModel() => DataLichSuTraLaiVanBanDi(
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
class LichSuTraLaiVanBanDiResponse extends Equatable {
  @JsonKey(name: 'NguoiTraLai')
  String? nguoiTraLai;
  @JsonKey(name: 'DonViTraLai')
  String? donViTraLai;
  @JsonKey(name: 'ThoiGian')
  String? thoiGian;
  @JsonKey(name: 'NoiDungTraLai')
  String? noiDungTraLai;
  @JsonKey(name: 'NguoiBiTraLai')
  String? nguoiBiTraLai;
  @JsonKey(name: 'DonViBiTraLai')
  String? donViBiTraLai;
  @JsonKey(name: 'Files')
  List<FilesResponse>? files;

  LichSuTraLaiVanBanDiResponse({
    this.nguoiTraLai,
    this.donViTraLai,
    this.thoiGian,
    this.noiDungTraLai,
    this.nguoiBiTraLai,
    this.donViBiTraLai,
    this.files,
  });

  factory LichSuTraLaiVanBanDiResponse.fromJson(Map<String, dynamic> json) =>
      _$LichSuTraLaiVanBanDiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LichSuTraLaiVanBanDiResponseToJson(this);

  LichSuTraLaiVanBanDi toModel() => LichSuTraLaiVanBanDi(
        nguoiTraLai: nguoiTraLai,
        donViTraLai: donViTraLai,
        thoiGian: DateTime.parse(thoiGian ?? '').formatApiLichSu,
        noiDungTraLai: noiDungTraLai?.parseHtml(),
        nguoiBiTraLai: nguoiBiTraLai,
        donViBiTraLai: donViBiTraLai,
        files: files?.map((e) => e.toModel()).toList() ?? [],
      );

  //todo convert to Model to use
  @override
  List<Object?> get props => [];
}
