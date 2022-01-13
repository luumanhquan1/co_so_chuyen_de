

class QLVBDocumentDetail {
  String? soVanBan;
  String? soDen;
  String? soPhu;
  String? noiGui;
  String? loaiVanBan;
  String? soKyHieu;
  String? ngayBH;
  String? ngayDen;
  String? doKhan;
  String? ngayHanXL;
  String? hanXL;
  String? nguoiKy;
  int? soBan = 0;
  int? soTrang = 0;
  String? phuongThucNhan;
  String? trichYeu;
  bool vanBanQlPL = false;
  bool hoiBao = false;
  bool daNhanBanGiay = false;

  // List<AttachedFileInfo> FileDinhKems = [];

  QLVBDocumentDetail();

  factory QLVBDocumentDetail.fromJson(Map<String, dynamic> json) {
    final QLVBDocumentDetail info = QLVBDocumentDetail();
    // info.VanBanId = json.stringValueOrEmpty('VanBanId');
    // info.IsDonViTrong = json.boolValue('IsDonViTrong');
    // info.TaskId = json.stringValueOrEmpty('TaskId');
    // info.TaskParentId = json.stringValueOrEmpty('TaskParentId');
    // info.SoVanBanId = json.stringValueOrEmpty('SoVanBanId');
    // info.SoVanBan = json.stringValueOrEmpty('SoVanBan');
    // info.DonViNgoaiId = json.stringValueOrEmpty('DonViNgoaiId');
    // info.DonViTrongId = json.stringValueOrEmpty('DonViTrongId');
    // info.DonViBanHanh = json.stringValueOrEmpty('DonViBanHanh');
    // info.DonViVaoSoLanDauId = json.stringValueOrEmpty('DonViVaoSoLanDauId');
    // info.SoDen = json['SoDen'];
    // info.SoPhu = json['SoPhu'];
    // info.LoaiVanBanId = json.stringValueOrEmpty('LoaiVanBanId');
    // info.LoaiVanBan = json.stringValueOrEmpty('LoaiVanBan');
    // info.SoKyHieu = json.stringValueOrEmpty('SoKyHieu');
    // info.NgayBanHanh = json.stringValueOrEmpty('NgayBanHanh');
    // info.NgayDen = json.stringValueOrEmpty('NgayDen');
    // info.TrichYeu = json.stringValueOrEmpty('TrichYeu');
    // info.IsChuyenCaBi = json.boolValue('IsChuyenCaBi');
    // info.IsLanhDao = json.boolValue('IsLanhDao');
    // info.IsThuTruongDonVi = json.boolValue('IsThuTruongDonVi');
    // info.DoKhanId = json.stringValueOrEmpty('DoKhanId');
    // info.DoKhan = json.stringValueOrEmpty('DoKhan');
    // info.NgayHanXuLy = json.stringValueOrEmpty('NgayHanXuLy');
    // info.HanXuLy = json.stringValueOrEmpty('HanXuLy');
    // info.FileDinhKemIds = json.stringValueOrEmpty('FileDinhKemIds');
    // info.NguoiKy = json.stringValueOrEmpty('NguoiKy');
    // info.SoBan = json.intValue('SoBan');
    // info.SoTrang = json.intValue('SoTrang');
    // info.PhuongThucNhanVanBanId =
    //     json.stringValueOrEmpty('PhuongThucNhanVanBanId');
    // info.PhuongThucNhan = json.stringValueOrEmpty('PhuongThucNhan');
    // info.IsQPPL = json.boolValue('IsQPPL');
    // info.IsHoiBao = json.boolValue('IsHoiBao');
    // info.IsNhanBanGiay = json.boolValue('IsNhanBanGiay');
    // info.NgayNhanBanGiay = json.stringValueOrEmpty('NgayNhanBanGiay');
    //
    // info.CoTheCapNhatTrangThai = json.boolValue('CoTheCapNhatTrangThai');
    // info.TrangThaiId = json.stringValueOrEmpty('TrangThaiId');
    // info.MaTrangThai = json.stringValueOrEmpty('MaTrangThai');
    // info.CoTheXoa = json.boolValue('CoTheXoa');
    // info.OwnerTypeCode = json.stringValueOrEmpty('OwnerTypeCode');
    // info.CoTheCapNhat = json.boolValue('CoTheCapNhat');
    // info.CoTheSua = json.boolValue('CoTheSua');
    // info.CoThePhanXuLy = json.boolValue('CoThePhanXuLy');
    // info.CoTheTraLai = json.boolValue('CoTheTraLai');
    //
    // info.CoTheThuHoi = json.boolValue('CoTheThuHoi');
    // info.NguoiTaoId = json.stringValueOrEmpty('NguoiTaoId');
    // info.IsChoYKien = json.boolValue('IsChoYKien');
    // info.IsDaChoYKien = json.boolValue('IsDaChoYKien');
    // info.IsNhanDeBiet = json.boolValue('IsNhanDeBiet');
    // info.ChoPhepThaoTac = json.boolValue('ChoPhepThaoTac');
    // info.ParentOwnerTaskId = json.stringValueOrEmpty('ParentOwnerTaskId');
    // info.LanhDaoId = json.stringValueOrEmpty('LanhDaoId');
    // final value = json.boolValue('IsReadOnlyTaskAssignment');
    // info.IsReadOnlyTaskAssignment = value;
    // info.CoTheTuChoi = json.boolValue('CoTheTuChoi');
    // info.IsTrucVanBan = json.boolValue('IsTrucVanBan');
    // info.MaPAKN = json.stringValueOrEmpty('MaPAKN');
    // final listFiles = json.arrayValueOrEmpty('FileDinhKems');
    // info.FileDinhKems =
    //     listFiles.map((e) => AttachedFileInfo.fromJson(e)).toList();
    return info;
  }

  List<DocumentDetailRow> toListRow() {
    final List<DocumentDetailRow> list = [
      DocumentDetailRow(
          'Sổ văn bản', soVanBan ?? '', TypeDocumentDetailRow.text),
      DocumentDetailRow(
          'Sổ văn bản', soDen ?? '', TypeDocumentDetailRow.text),
      DocumentDetailRow(
          'Sổ văn bản', soPhu ?? '', TypeDocumentDetailRow.text),
      DocumentDetailRow(
          'Sổ văn bản', noiGui ?? '', TypeDocumentDetailRow.text),
      DocumentDetailRow(
          'Sổ văn bản', loaiVanBan ?? '', TypeDocumentDetailRow.text),
      DocumentDetailRow(
          'Sổ văn bản', soKyHieu ?? '', TypeDocumentDetailRow.text),
      DocumentDetailRow(
          'Sổ văn bản', ngayBH ?? '', TypeDocumentDetailRow.text),
      DocumentDetailRow(
          'Sổ văn bản', ngayDen ?? '', TypeDocumentDetailRow.text),
      DocumentDetailRow(
          'Sổ văn bản', doKhan ?? '', TypeDocumentDetailRow.text),
      DocumentDetailRow(
          'Sổ văn bản', ngayHanXL ?? '', TypeDocumentDetailRow.text),
      DocumentDetailRow(
          'Sổ văn bản', hanXL ?? '', TypeDocumentDetailRow.text),
      DocumentDetailRow(
          'Sổ văn bản', nguoiKy ?? '', TypeDocumentDetailRow.text),
      DocumentDetailRow(
          'Sổ văn bản', soBan ?? '', TypeDocumentDetailRow.text),
      DocumentDetailRow(
          'Sổ văn bản', soTrang ?? '', TypeDocumentDetailRow.text),
      DocumentDetailRow(
          'Sổ văn bản', phuongThucNhan ?? '', TypeDocumentDetailRow.text),
      DocumentDetailRow(
          'Sổ văn bản', trichYeu ?? '', TypeDocumentDetailRow.text),
      DocumentDetailRow(
          'Sổ văn bản', vanBanQlPL ?? '', TypeDocumentDetailRow.checkbox),
      DocumentDetailRow(
          'Sổ văn bản', hoiBao ?? '', TypeDocumentDetailRow.checkbox),
      DocumentDetailRow(
          'Sổ văn bản', daNhanBanGiay ?? '', TypeDocumentDetailRow.checkbox),

      // DocumentDetailRow(tr('ctvb_so_den'),
      //     SoDen == null ? '' : SoDen.toString(), TypeDocumentDetailRow.text),
      // DocumentDetailRow(tr('ctvb_so_phu'),
      //     SoPhu == null ? '' : SoPhu.toString(), TypeDocumentDetailRow.text),
      // DocumentDetailRow(
      //     tr('ctvb_noi_gui'), DonViBanHanh ?? '', TypeDocumentDetailRow.text),
      // DocumentDetailRow(tr('ctvb_loai_van_ban'), LoaiVanBan ?? '',
      //     TypeDocumentDetailRow.text),
      // DocumentDetailRow(
      //     tr('ctvb_so_ky_hieu'), SoKyHieu ?? '', TypeDocumentDetailRow.text),
      // DocumentDetailRow(tr('ctvb_ngay_ban_hanh'), NgayBanHanh ?? '',
      //     TypeDocumentDetailRow.text),
      // DocumentDetailRow(
      //     tr('ctvb_ngay_den'), NgayDen ?? '', TypeDocumentDetailRow.text),
      // DocumentDetailRow(
      //     tr('ctvb_do_khan'), DoKhan ?? '', TypeDocumentDetailRow.text),
      // DocumentDetailRow(tr('ctvb_ngay_han_xu_ly'), NgayHanXuLy ?? '',
      //     TypeDocumentDetailRow.text),
      // DocumentDetailRow(
      //     tr('ctvb_han_xu_ly'), HanXuLy ?? '', TypeDocumentDetailRow.text),
      // DocumentDetailRow(
      //     tr('ctvb_nguoi_ky'), NguoiKy ?? '', TypeDocumentDetailRow.text),
      // DocumentDetailRow(
      //     tr('ctvb_so_ban'), SoBan.toString(), TypeDocumentDetailRow.text),
      // DocumentDetailRow(
      //     tr('ctvb_so_trang'), SoTrang.toString(), TypeDocumentDetailRow.text),
      // DocumentDetailRow(tr('ctvb_phuong_thuc_nhan'), PhuongThucNhan ?? '',
      //     TypeDocumentDetailRow.text),
      // DocumentDetailRow(
      //     tr('ctvb_trich_yeu'), TrichYeu ?? '', TypeDocumentDetailRow.text),
      // DocumentDetailRow(
      //     tr('ctvb_vanban_vppl'), IsQPPL, TypeDocumentDetailRow.checkbox),
      // DocumentDetailRow(
      //     tr('ctvb_hoi_bao_vb'), IsHoiBao, TypeDocumentDetailRow.checkbox),
      // DocumentDetailRow(tr('ctvb_da_nhan_ban_giay'), IsNhanBanGiay,
      //     TypeDocumentDetailRow.checkbox),
    ];
    // if (IsNhanBanGiay) {
    //   final row = DocumentDetailRow(tr('ctvb_ngay_nhan_ban_giay'),
    //       NgayNhanBanGiay ?? '', TypeDocumentDetailRow.text);
    //   if (list.length > 16) {
    //     list.insert(16, row);
    //   } else {
    //     list.add(row);
    //   }
    // }
    return list;
  }
}

enum TypeDocumentDetailRow { checkbox, text, fileActacks }

class DocumentDetailRow {
  String title = '';
  dynamic value;
  TypeDocumentDetailRow type = TypeDocumentDetailRow.text;

  DocumentDetailRow(this.title, this.value, this.type);

  DocumentDetailRow.DocumentDefault(
      this.title,
      this.value,
      );

}
