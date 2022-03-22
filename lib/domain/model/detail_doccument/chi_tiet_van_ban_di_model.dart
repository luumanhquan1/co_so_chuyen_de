import 'package:ccvc_mobile/generated/l10n.dart';

import 'document_detail_row.dart';

class ChiTietVanBanDiModel {
  String? id;
  String? processType;
  String? maPAKN;
  String? processTypeId;
  String? fileNotation;
  String? subject;
  String? dueDate;
  String? ngayTao;
  String? ngayBanHanh;
  String? loaiNguonDuLieu;
  String? tenNguoiSoanThao;
  String? donViSoanThao;
  String? donViBanHanh;
  int? idVanBanGoc;
  String? kyHieuVanBanGoc;
  bool? isDaKyPhieuTrinh;
  List<DonViTrongHeThongs>? donViTrongHeThongs;
  List<DonViNgoaiHeThongs>? donViNgoaiHeThongs;
  String? idDoKhan;
  String? doKhan;
  int? issuedAmount;
  bool? isLaVanBanTraLoi;
  bool? isVanBanQppl;
  bool? isVanBanDiBanHanh;
  bool? isVanBanChiDao;
  String? vanBanDenResponses;
  String? vanBanChiDaoResponses;
  List<NguoiTheoDoi>? nguoiTheoDoiResponses;
  List<NguoiKyDuyetModel>? nguoiKyDuyetResponses;
  String? nguoiKy;
  String? noiNhanTrongHeThong;
  String? noiNhanNgoaiHeThong;
  String? nhanDeBiet;
  List<FileDinhKemVanBanDiModel>? fileDinhKemVanBanDiResponses;
  List<String>? danhSachChoYKien;
  bool? isCanTrinhKy;
  bool? isCanHuyTrinhKy;
  bool? isCanThuHoiBanHanh;
  bool? isCanTraLai;
  bool? isCanDuyet;
  bool? isCanHuyDuyet;
  bool? isCanCapSo;
  bool? isCanBanHanh;
  bool? isCanSua;
  bool? isCanTrinhKyTiepTheo;
  bool? isCanBanHanhBoSung;
  bool? isCanXoa;
  bool? isCanChoYKien;
  bool? isCanXinYKien;
  bool? isScan;
  bool? isCanCopy;

  ChiTietVanBanDiModel({
    this.id,
    this.processType,
    this.maPAKN,
    this.processTypeId,
    this.fileNotation,
    this.subject,
    this.dueDate,
    this.ngayTao,
    this.ngayBanHanh,
    this.loaiNguonDuLieu,
    this.tenNguoiSoanThao,
    this.donViSoanThao,
    this.donViBanHanh,
    this.idVanBanGoc,
    this.kyHieuVanBanGoc,
    this.isDaKyPhieuTrinh,
    this.idDoKhan,
    this.doKhan,
    this.issuedAmount,
    this.isLaVanBanTraLoi,
    this.isVanBanQppl,
    this.isVanBanDiBanHanh,
    this.isVanBanChiDao,
    this.vanBanDenResponses,
    this.vanBanChiDaoResponses,
    this.donViTrongHeThongs,
    this.donViNgoaiHeThongs,
    this.nguoiTheoDoiResponses,
    this.nguoiKyDuyetResponses,
    this.nguoiKy,
    this.noiNhanTrongHeThong,
    this.noiNhanNgoaiHeThong,
    this.nhanDeBiet,
    this.fileDinhKemVanBanDiResponses,
    this.danhSachChoYKien,
    this.isCanTrinhKy,
    this.isCanHuyTrinhKy,
    this.isCanThuHoiBanHanh,
    this.isCanTraLai,
    this.isCanDuyet,
    this.isCanHuyDuyet,
    this.isCanCapSo,
    this.isCanBanHanh,
    this.isCanSua,
    this.isCanTrinhKyTiepTheo,
    this.isCanBanHanhBoSung,
    this.isCanXoa,
    this.isCanChoYKien,
    this.isCanXinYKien,
    this.isScan,
    this.isCanCopy,
  });

  List<DocumentDetailRow> toListRowHead() {
    final List<DocumentDetailRow> list = [
      DocumentDetailRow(S.current.loai_van_ban_di, vanBanBanhanh(),
          TypeDocumentDetailRow.text),
      DocumentDetailRow(
          S.current.ma_pakn, maPAKN ?? '', TypeDocumentDetailRow.text),
      DocumentDetailRow(S.current.dv_soan_thao, donViSoanThao ?? '',
          TypeDocumentDetailRow.text),
      DocumentDetailRow(S.current.nguoi_soan_thao, tenNguoiSoanThao ?? '',
          TypeDocumentDetailRow.text),
      DocumentDetailRow(
          S.current.loai_van_ban, processType??'', TypeDocumentDetailRow.text),
      DocumentDetailRow(
          S.current.ky_hieu, kyHieuVanBanGoc ?? '', TypeDocumentDetailRow.text),
      DocumentDetailRow(
          S.current.ngay_han_xl, ngayBanHanh??'', TypeDocumentDetailRow.text),
      DocumentDetailRow(
          S.current.nguoi_theo_doi_van_ban, '', TypeDocumentDetailRow.text),
      DocumentDetailRow(S.current.do_khan, doKhan??'', TypeDocumentDetailRow.text),

      DocumentDetailRow(
          S.current.trich_yeu, subject??'', TypeDocumentDetailRow.text),
    ];

    return list;
  }

  List<DocumentDetailRow> toListRowBottom() {
    final List<DocumentDetailRow> list = [
      DocumentDetailRow(
          S.current.dv_trong_he_thong,
          '',
          TypeDocumentDetailRow.text),
      DocumentDetailRow(
          S.current.dv_ngoai_he_thong,
          '',
          TypeDocumentDetailRow.text),
    ];

    return list;
  }

  String vanBanBanhanh() {
    if (isVanBanDiBanHanh == true) {
      return S.current.van_ban_di_ban_hanh;
    } else if(isVanBanChiDao==true) {
      return S.current.van_ban_di_noi_bo;
    }else{
      return '';
    }
  }

  List<DocumentDetailRow> toListCheckBox() {
    final List<DocumentDetailRow> listCheckbox = [
      DocumentDetailRow(S.current.van_ban_qppl, isVanBanQppl ?? false,
          TypeDocumentDetailRow.checkbox),
      DocumentDetailRow(
        S.current.hoi_bao_van_ban,
        isLaVanBanTraLoi ?? false,
        TypeDocumentDetailRow.checkbox,
      ),
      DocumentDetailRow(
        S.current.da_nhan_ban_giay,
        isVanBanChiDao ?? false,
        TypeDocumentDetailRow.checkbox,
      )
    ];

    return listCheckbox;
  }
}

class NguoiKyDuyetModel {
  String? id;
  String? idHost;
  String? tenNguoiKy;
  String? donViNguoiKy;
  String? vaiTro;
  int? loaiBanHanh;
  int? thuTu;
  String? idUser;

  NguoiKyDuyetModel({
    this.id,
    this.idHost,
    this.tenNguoiKy,
    this.donViNguoiKy,
    this.vaiTro,
    this.loaiBanHanh,
    this.thuTu,
    this.idUser,
  });
}

class FileDinhKemVanBanDiModel {
  String? id;
  String? idFileGoc;
  String? ten;
  String? isSign;
  String? duongDan;
  String? duoiMoRong;
  bool? qrCreated;
  int? loaiFileDinhKem;

  FileDinhKemVanBanDiModel({
    this.id,
    this.idFileGoc,
    this.ten,
    this.isSign,
    this.duongDan,
    this.duoiMoRong,
    this.qrCreated,
    this.loaiFileDinhKem,
  });
}

class DonViTrongHeThongs {
  int? trangThaiBanHanh;
  bool? isPhaiGuiBanGiay;
  bool? isTrangThaiLienThong;
  String? idDonViCanBo;
  bool? isDonVi;
  int? thuTu;
  String? ten;

  DonViTrongHeThongs({
    this.trangThaiBanHanh,
    this.isPhaiGuiBanGiay,
    this.isTrangThaiLienThong,
    this.idDonViCanBo,
    this.isDonVi,
    this.thuTu,
    this.ten,
  });
}

class DonViNgoaiHeThongs {
  int? trangThaiBanHanh;
  bool? isPhaiGuiBanGiay;
  bool? isTrangThaiLienThong;
  String? idDonViCanBo;
  bool? isDonVi;
  int? thuTu;
  String? ten;

  DonViNgoaiHeThongs(
      {this.trangThaiBanHanh,
      this.isPhaiGuiBanGiay,
      this.isTrangThaiLienThong,
      this.idDonViCanBo,
      this.isDonVi,
      this.thuTu,
      this.ten});
}

class NguoiTheoDoi {
  String? id;
  String? hoTen;
  String? donVi;
  String? chucVu;
  String? idChucVu;
  String? idDonVi;
  String? tenTaiKhoan;
  String? sdt;
  String? ngaySinh;
  String? gioiTinh;
  String? email;
  String? pathAnhDaiDien;
  String? pathChuKy;
  String? user;
  String? anhDaiDien;
  String? anhChuKy;

  NguoiTheoDoi(
      {this.id,
      this.hoTen,
      this.donVi,
      this.chucVu,
      this.idChucVu,
      this.idDonVi,
      this.tenTaiKhoan,
      this.sdt,
      this.ngaySinh,
      this.gioiTinh,
      this.email,
      this.pathAnhDaiDien,
      this.pathChuKy,
      this.user,
      this.anhDaiDien,
      this.anhChuKy});
}
