import 'package:ccvc_mobile/domain/model/detail_doccument/document_detail_row.dart';

class PhatBieuModel {
  String? phienHop = '';
  String? nguoiPhatBieu = '';
  String? ndPhatBieu = '';
  String? tthoiGian = '';

  PhatBieuModel({
    required this.phienHop,
    required this.nguoiPhatBieu,
    required this.ndPhatBieu,
    required this.tthoiGian,
  });

  PhatBieuModel.fromDetail();

  List<DocumentDetailRow> toListRowPhatBieu() {
    final List<DocumentDetailRow> list = [
      DocumentDetailRow('Phiên họp', phienHop, TypeDocumentDetailRow.text),
      DocumentDetailRow(
          'Người phát biểu', nguoiPhatBieu, TypeDocumentDetailRow.text),
      DocumentDetailRow('ND phát biểu', ndPhatBieu, TypeDocumentDetailRow.text),
      DocumentDetailRow('Thời gian', tthoiGian, TypeDocumentDetailRow.text),
    ];
    return list;
  }
}
