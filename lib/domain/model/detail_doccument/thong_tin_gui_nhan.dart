import 'package:ccvc_mobile/generated/l10n.dart';

import 'document_detail_row.dart';

class DetailDocumentProfileSend {
  String? nguoiGui = '';
  String? donViGui = '';
  String? thoiGian = '';
  String? nguoiNhan = '';
  String? donViNhan = '';
  String? vaiTro = '';
  String? trangThai = '';

  DetailDocumentProfileSend({
    required this.nguoiGui,
    required this.donViGui,
    required this.donViNhan,
    required this.trangThai,
    required this.nguoiNhan,
    required this.thoiGian,
    required this.vaiTro,
  });

  DetailDocumentProfileSend.fromDetail();

  factory DetailDocumentProfileSend.fromJson(Map<String, dynamic> json) {
    return DetailDocumentProfileSend(
      nguoiGui: json[''],
      donViGui: json[''],
      thoiGian: json[''],
      nguoiNhan: json[''],
      donViNhan: json[''],
      vaiTro: json[''],
      trangThai: json[''].trim(),
    );
  }

  List<DocumentDetailRow> toListRow() {
    final List<DocumentDetailRow> list = [
      DocumentDetailRow(S.current.nguoi_gui, nguoiGui, TypeDocumentDetailRow.text),
      DocumentDetailRow(S.current.don_vi_gui, donViGui, TypeDocumentDetailRow.text),
      DocumentDetailRow(S.current.thoi_gian, thoiGian, TypeDocumentDetailRow.text),
      DocumentDetailRow(S.current.nguoi_nhan, nguoiNhan, TypeDocumentDetailRow.text),
      DocumentDetailRow(S.current.don_vi_nhan, donViNhan, TypeDocumentDetailRow.text),
      DocumentDetailRow(S.current.vai_tro_xu_ly, vaiTro, TypeDocumentDetailRow.text),
      DocumentDetailRow(S.current.trang_thai, trangThai, TypeDocumentDetailRow.text),
    ];

    return list;
  }
}
