import 'package:ccvc_mobile/nhiem_vu_module/domain/model/danh_sach_cong_viec_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'danh_sach_cong_viec_response.g.dart';

@JsonSerializable()
class DanhSachCongViecResponse {
  @JsonKey(name: 'PageData')
  List<PageDataResponse>? pageData;
  @JsonKey(name: 'TotalRows')
  int? totalRows;
  @JsonKey(name: 'CurrentPage')
  int? currentPage;
  @JsonKey(name: 'PageSize')
  int? pageSize;
  @JsonKey(name: 'TotalPage')
  int? totalPage;

  DanhSachCongViecResponse(this.pageData);

  factory DanhSachCongViecResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DanhSachCongViecResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DanhSachCongViecResponseToJson(this);

  DanhSachCongViecModel toDoMain() => DanhSachCongViecModel(
        pageData: pageData?.map((e) => e.toDomain()).toList() ?? [],
        totalRows: totalRows,
        currentPage: currentPage,
        pageSize: pageSize,
        totalPage: totalPage,
      );
}

@JsonSerializable()
class PageDataResponse {
  @JsonKey(name: 'Stt')
  String? stt;
  @JsonKey(name: 'Id')
  String? id;
  @JsonKey(name: 'TenCv')
  String? tenCv;
  @JsonKey(name: 'MaCv')
  String? maCv;
  @JsonKey(name: 'TrangThaiHanXuLy')
  int? trangThaiHanXuLy;
  @JsonKey(name: 'NoiDungCongViec')
  String? noiDungCongViec;
  @JsonKey(name: 'DoiTuongThucHien')
  String? doiTuongThucHien;
  @JsonKey(name: 'DonViThucHien')
  String? donViThucHien;
  @JsonKey(name: 'DonViThucHienId')
  String? donViThucHienId;
  @JsonKey(name: 'CaNhanThucHien')
  String? caNhanThucHien;
  @JsonKey(name: 'NguoiThucHienId')
  String? nguoiThucHienId;
  @JsonKey(name: 'NguoiThucHien')
  String? nguoiThucHien;
  @JsonKey(name: 'HanXuLyFormatDate')
  String? hanXuLyFormatDate;
  @JsonKey(name: 'ThoiGianGiaoFormatDate')
  String? thoiGianGiaoFormatDate;
  @JsonKey(name: 'HanXuLy')
  String? hanXuLy;
  @JsonKey(name: 'ThoiGianGiaoViec')
  String? thoiGianGiaoViec;
  @JsonKey(name: 'NguoiGiaoViec')
  String? nguoiGiaoViec;
  @JsonKey(name: 'DonViGiaoViec')
  String? donViGiaoViec;
  @JsonKey(name: 'DonViGiaoViecId')
  String? donViGiaoViecId;
  @JsonKey(name: 'TrangThai')
  String? trangThai;
  @JsonKey(name: 'MaTrangThai')
  String? maTrangThai;
  @JsonKey(name: 'TrangThaiId')
  String? trangThaiId;
  @JsonKey(name: 'MaNhiemVu')
  String? maNhiemVu;
  @JsonKey(name: 'NhiemVuId')
  String? nhiemVuId;
  @JsonKey(name: 'MucDoCongViecId')
  String? mucDoCongViecId;
  @JsonKey(name: 'MucDoCongViec')
  String? mucDoCongViec;
  @JsonKey(name: 'NoiDungNhiemVu')
  String? noiDungNhiemVu;
  @JsonKey(name: 'NguoiTaoId')
  String? nguoiTaoId;
  @JsonKey(name: 'NguoiTao')
  String? nguoiTao;
  @JsonKey(name: 'CurrentDonVi')
  String? currentDonVi;
  @JsonKey(name: 'ActionDate')
  String? actionDate;
  @JsonKey(name: 'CongViecLienQuan')
  String? congViecLienQuan;
  @JsonKey(name: 'IsFromCaNhan')
  bool? isFromCaNhan;
  @JsonKey(name: 'WTrangThai')
  int? wTrangThai;
  @JsonKey(name: 'CoTheCapNhatTinhHinh')
  bool? coTheCapNhatTinhHinh;
  @JsonKey(name: 'CoTheSua')
  bool? coTheSua;
  @JsonKey(name: 'CoTheHuy')
  bool? coTheHuy;
  @JsonKey(name: 'CoTheGan')
  bool? coTheGan;
  @JsonKey(name: 'CoTheXoa')
  bool? coTheXoa;

  PageDataResponse();

  factory PageDataResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PageDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PageDataResponseToJson(this);

  PageDatas toDomain() => PageDatas(
        stt: stt,
        id: id,
        tenCv: tenCv,
        maCv: maCv,
        trangThaiHanXuLy: trangThaiHanXuLy,
        noiDungCongViec: noiDungCongViec,
        doiTuongThucHien: doiTuongThucHien,
        donViThucHien: donViThucHien,
        donViThucHienId: donViThucHienId,
        caNhanThucHien: caNhanThucHien,
        nguoiThucHienId: nguoiThucHienId,
        nguoiThucHien: nguoiThucHien,
        hanXuLyFormatDate: hanXuLyFormatDate,
        thoiGianGiaoFormatDate: thoiGianGiaoFormatDate,
        hanXuLy: hanXuLy,
        thoiGianGiaoViec: thoiGianGiaoViec,
        nguoiGiaoViec: nguoiGiaoViec,
        donViGiaoViec: donViGiaoViec,
        donViGiaoViecId: donViGiaoViecId,
        trangThai: trangThai,
        maTrangThai: maTrangThai,
        trangThaiId: trangThaiId,
        maNhiemVu: maNhiemVu,
        nhiemVuId: nhiemVuId,
        mucDoCongViecId: mucDoCongViecId,
        mucDoCongViec: mucDoCongViec,
        noiDungNhiemVu: noiDungNhiemVu,
        nguoiTaoId: nguoiTaoId,
        nguoiTao: nguoiTao,
        currentDonVi: currentDonVi,
        actionDate: actionDate,
        congViecLienQuan: congViecLienQuan,
        isFromCaNhan: isFromCaNhan,
        wTrangThai: wTrangThai,
        coTheCapNhatTinhHinh: coTheCapNhatTinhHinh,
        coTheSua: coTheSua,
        coTheHuy: coTheHuy,
        coTheGan: coTheGan,
        coTheXoa: coTheXoa,
      );
}
