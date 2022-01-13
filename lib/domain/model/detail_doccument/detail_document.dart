import 'dart:core';

import 'package:ccvc_mobile/domain/model/detail_doccument/document_detail_row.dart';

enum TrangThaiMission {
  THU_HOI,
  CHUA_THUC_HIEN,
  DA_HOAN_THANH,
  CHO_PHAN_XU_LY,
  DANG_THUC_HIEN,
  TRA_LAI
}

extension trangThaiMission on TrangThaiMission {
  String getName() {
    switch (this) {
      case TrangThaiMission.THU_HOI:
        return 'THU_HOI';
      case TrangThaiMission.CHUA_THUC_HIEN:
        return 'CHUA_THUC_HIEN';
      case TrangThaiMission.DA_HOAN_THANH:
        return 'DA_HOAN_THANH';
      case TrangThaiMission.CHO_PHAN_XU_LY:
        return 'CHO_PHAN_XU_LY';
      case TrangThaiMission.DANG_THUC_HIEN:
        return 'DANG_THUC_HIEN';
      case TrangThaiMission.TRA_LAI:
        return 'TRA_LAI';
    }
  }
}

class DetailDocumentModel {
  bool CoTheCapNhatTinhHinhThucHien = false;
  bool CoTheDonDoc = false;
  bool CoTheSua = false;
  bool CoTheThuHoi = false;
  bool CoTheTraLai = false;
  bool CoTheXoa = false;
  String HanXuLy = '';
  String HanXuLyVPCP = '';
  String Id = '';
  String NguoiGiao = '';
  String NguoiTaoId = '';
  String ProcessCode = '';
  String ProcessContent = '';
  String ProcessTypeCode = '';
  String ProcessTypeId = '';
  String ProcessTypeName = '';
  String StatusCode = '';
  String StatusId = '';
  String StatusName = '';
  String TaskId = '';
  bool isPersonal = false;

  DetailDocumentModel(
      {required this.CoTheCapNhatTinhHinhThucHien,
      required this.CoTheDonDoc,
      required this.CoTheSua,
      required this.CoTheThuHoi,
      required this.CoTheTraLai,
      required this.CoTheXoa,
      required this.HanXuLy,
      required this.HanXuLyVPCP,
      required this.Id,
      required this.NguoiGiao,
      required this.NguoiTaoId,
      required this.ProcessCode,
      required this.ProcessContent,
      required this.ProcessTypeId,
      required this.ProcessTypeName,
      required this.StatusCode,
      required this.StatusId,
      required this.StatusName,
      required this.TaskId});

  DetailDocumentModel.fromDetail();

  factory DetailDocumentModel.fromJson(Map<String, dynamic> json) {
    return DetailDocumentModel(
        CoTheCapNhatTinhHinhThucHien: json['CoTheCapNhatTinhHinhThucHien'],
        CoTheDonDoc: json['CoTheDonDoc'],
        CoTheSua: json['CoTheSua'],
        CoTheThuHoi: json['CoTheThuHoi'],
        CoTheTraLai: json['CoTheTraLai'],
        CoTheXoa: json['CoTheXoa'],
        HanXuLy: json['HanXuLy'].trim(),
        HanXuLyVPCP: json['HanXuLyVPCP'].trim(),
        Id: json['Id'].trim(),
        NguoiGiao: json['NguoiGiao'].trim(),
        NguoiTaoId: json['NguoiTaoId'].trim(),
        ProcessCode: json['ProcessCode'].trim(),
        ProcessContent: json['ProcessContent'].stripHtmlIfNeeded().trim(),
        ProcessTypeId: json['ProcessTypeId'].trim(),
        ProcessTypeName: json['ProcessTypeName'].trim(),
        StatusCode: json['StatusCode'].trim(),
        StatusId: json['StatusId'].trim(),
        StatusName: json['StatusName'].trim(),
        TaskId: json['TaskId'].trim());
  }

  List<DocumentDetailRow> toListRow() {
    final List<DocumentDetailRow> list = [
      DocumentDetailRow(
          'detail_mission_loaiNV', ProcessTypeName, TypeDocumentDetailRow.text),
      DocumentDetailRow(
          'detail_mission_th_thuchien', StatusName, TypeDocumentDetailRow.text),
      DocumentDetailRow(
          'detail_mission_noidung', ProcessContent, TypeDocumentDetailRow.text),
      DocumentDetailRow(
          'detail_mission_sonv', ProcessCode, TypeDocumentDetailRow.text),
      DocumentDetailRow(
          'detail_mission_hanxuly', HanXuLy, TypeDocumentDetailRow.text),
    ];

    //   if (ProcessTypeName == 'Nhiệm vụ CP/VPCP') {
    //     list.insert(
    //       2,
    //       DocumentDetailRow('detail_mission_dvtheodoi', metadata.DonViTheoDoi,
    //           TypeDocumentDetailRow.text),
    //     );
    //     list.add(DocumentDetailRow(tr('detail_mission_hanxylyly_VPCP'),
    //         HanXuLyVPCP, TypeDocumentDetailRow.text));
    //     list.add(DocumentDetailRow(tr('detail_mission_nguoitheodoi'),
    //         metadata.NguoiTheoDoi, TypeDocumentDetailRow.text));
    //   } else {
    //     list.insert(
    //         2,
    //         DocumentDetailRow(tr('detail_mission_nguoiGiao'), NguoiGiao,
    //             TypeDocumentDetailRow.text));
    //   }
    //
    //   return list;
    // }

    // List<DocumentDetailRow> toListRowReturnMissionCp() {
    //   final List<DocumentDetailRow> list = [
    //     DocumentDetailRow(tr('detail_mission_noidung'), ProcessContent,
    //         TypeDocumentDetailRow.text),
    //     DocumentDetailRow(
    //         tr('detail_mission_sonv'), ProcessCode, TypeDocumentDetailRow.text),
    //     DocumentDetailRow(
    //         tr('detail_mission_so/kyhieu'), '', TypeDocumentDetailRow.text),
    //     DocumentDetailRow(
    //         tr('detail_mission_ngayvanban'), '', TypeDocumentDetailRow.text),
    //   ];
    //   return list;
    // }
    return list;
  }
}
