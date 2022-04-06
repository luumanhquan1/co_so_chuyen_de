import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/lich_su_don_doc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lich_su_don_doc_nhiem_vu_response.g.dart';

@JsonSerializable()
class DataLichSuDonDocNhiemVuModelResponse extends Equatable {
  @JsonKey(name: 'Messages')
  String? message;
  @JsonKey(name: 'Data')
  List<LichSuDonDocNhiemVuModelResponse>? data;
  @JsonKey(name: 'IsSuccess')
  bool? isSuccess;

  DataLichSuDonDocNhiemVuModelResponse({
    this.message,
    this.data,
    this.isSuccess,
  });

  factory DataLichSuDonDocNhiemVuModelResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DataLichSuDonDocNhiemVuModelResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DataLichSuDonDocNhiemVuModelResponseToJson(this);

  //todo convert to Model to use
  @override
  List<Object?> get props => [];
}

@JsonSerializable()
class LichSuDonDocNhiemVuModelResponse extends Equatable {
  @JsonKey(name: 'NguoiTaoXuLy')
  String? nguoiTaoXuLy;
  @JsonKey(name: 'DonViTaoXuLy')
  String? donViTaoXuLy;
  @JsonKey(name: 'ThoiGianTao')
  String? thoiGianTao;
  @JsonKey(name: 'NoiDung')
  String? noiDung;
  @JsonKey(name: 'NguoiXuLy')
  String? nguoiXuLy;
  @JsonKey(name: 'DonViXuLy')
  String? donViXuLy;

  LichSuDonDocNhiemVuModelResponse({
    this.nguoiTaoXuLy,
    this.donViTaoXuLy,
    this.thoiGianTao,
    this.noiDung,
    this.nguoiXuLy,
    this.donViXuLy,
  });

  factory LichSuDonDocNhiemVuModelResponse.fromJson(
          Map<String, dynamic> json) =>
      _$LichSuDonDocNhiemVuModelResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LichSuDonDocNhiemVuModelResponseToJson(this);

  LichSuDonDocNhiemVuModel toModel() => LichSuDonDocNhiemVuModel(
        nguoiTaoXuLy: nguoiTaoXuLy,
        donViTaoXuLy: donViTaoXuLy,
        thoiGianTao: thoiGianTao,
        noiDung: noiDung,
        nguoiXuLy: nguoiXuLy,
        donViXuLy: donViXuLy,
      );

  //todo convert to Model to use
  @override
  List<Object?> get props => [];
}
