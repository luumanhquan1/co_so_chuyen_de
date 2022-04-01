import 'package:ccvc_mobile/domain/model/detail_doccument/lich_su_thu_hoi_van_ban_di_model.dart';
import 'package:ccvc_mobile/tien_ich_module/utils/extensions/date_time_extension.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lich_su_thu_hoi_van_ban_di_response.g.dart';

@JsonSerializable()
class DataLichSuThuHoiVanBanDiResponse extends Equatable {
  @JsonKey(name: 'Messages')
  String? messages;
  @JsonKey(name: 'Data')
  List<LichSuThuHoiVanBanDiResponse>? data;
  @JsonKey(name: 'ValidationResult')
  String? validationResult;
  @JsonKey(name: 'IsSuccess')
  bool? isSuccess;

  DataLichSuThuHoiVanBanDiResponse({
    this.messages,
    this.data,
    this.validationResult,
    this.isSuccess,
  });

  factory DataLichSuThuHoiVanBanDiResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DataLichSuThuHoiVanBanDiResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DataLichSuThuHoiVanBanDiResponseToJson(this);

  DataLichSuThuHoiVanBanDi toModel() => DataLichSuThuHoiVanBanDi(
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
class LichSuThuHoiVanBanDiResponse extends Equatable {
  @JsonKey(name: 'NguoiThuHoi')
  String? nguoiThuHoi;
  @JsonKey(name: 'DonViThuHoi')
  String? donViThuHoi;
  @JsonKey(name: 'ThoiGian')
  String? thoiGian;
  @JsonKey(name: 'NoiDungThuHoi')
  String? noiDungThuHoi;
  @JsonKey(name: 'NguoiBiThuHoi')
  String? nguoiBiThuHoi;
  @JsonKey(name: 'DonViBiThuHoi')
  String? donViBiThuHoi;
  @JsonKey(name: 'Files')
  List<FilesResponse>? files;

  LichSuThuHoiVanBanDiResponse({
    this.nguoiThuHoi,
    this.donViThuHoi,
    this.thoiGian,
    this.noiDungThuHoi,
    this.nguoiBiThuHoi,
    this.donViBiThuHoi,
    this.files,
  });

  factory LichSuThuHoiVanBanDiResponse.fromJson(Map<String, dynamic> json) =>
      _$LichSuThuHoiVanBanDiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LichSuThuHoiVanBanDiResponseToJson(this);

  LichSuThuHoiVanBanDi toModel() => LichSuThuHoiVanBanDi(
        nguoiThuHoi: nguoiThuHoi,
        donViThuHoi: donViThuHoi,
        thoiGian: DateTime.parse(thoiGian ?? '').formatApiLichSu,
        noiDungThuHoi: noiDungThuHoi?.parseHtml(),
        nguoiBiThuHoi: nguoiBiThuHoi,
        donViBiThuHoi: donViBiThuHoi,
        files: files?.map((e) => e.toModel()).toList() ?? [],
      );

  //todo convert to Model to use
  @override
  List<Object?> get props => [];
}

@JsonSerializable()
class FilesResponse extends Equatable {
  @JsonKey(name: 'Id')
  String? id;
  @JsonKey(name: 'Ten')
  String? ten;
  @JsonKey(name: 'DuongDan')
  String? duongDan;
  @JsonKey(name: 'DuoiMoRong')
  String? duoiMoRong;
  @JsonKey(name: 'DungLuong')
  String? dungLuong;
  @JsonKey(name: 'KieuDinhKem')
  String? kieuDinhKem;

  FilesResponse({
    this.id,
    this.ten,
    this.duongDan,
    this.duoiMoRong,
    this.dungLuong,
    this.kieuDinhKem,
  });

  factory FilesResponse.fromJson(Map<String, dynamic> json) =>
      _$FilesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FilesResponseToJson(this);

  Files toModel() => Files(
        id: id,
        ten: ten,
        duongDan: duongDan,
        duoiMoRong: duoiMoRong,
        dungLuong: dungLuong,
        kieuDinhKem: kieuDinhKem,
      );

  //todo convert to Model to use
  @override
  List<Object?> get props => [];
}
