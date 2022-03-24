import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/document_detail_row.dart';

class DataLichSuThuHoiVanBanDi {
  String? messages;
  List<LichSuThuHoiVanBanDi>? data;
  String? validationResult;
  bool? isSuccess;

  DataLichSuThuHoiVanBanDi({
    this.messages,
    this.data,
    this.validationResult,
    this.isSuccess,
  });
}

class LichSuThuHoiVanBanDi {
  String? nguoiThuHoi;
  String? donViThuHoi;
  String? thoiGian;
  String? noiDungThuHoi;
  String? nguoiBiThuHoi;
  String? donViBiThuHoi;
  List<Files>? files;

  LichSuThuHoiVanBanDi({
    this.nguoiThuHoi,
    this.donViThuHoi,
    this.thoiGian,
    this.noiDungThuHoi,
    this.nguoiBiThuHoi,
    this.donViBiThuHoi,
    this.files,
  });

  List<DocumentDetailRow> toListRowThuHoi() {
    final List<DocumentDetailRow> list = [
      DocumentDetailRow(
        S.current.nguoi_thu_hoi,
        nguoiThuHoi??'',
        TypeDocumentDetailRow.text,
      ),
      DocumentDetailRow(
        S.current.dv_thu_hoi,
        donViThuHoi??'',
        TypeDocumentDetailRow.text,
      ),
      DocumentDetailRow(
        S.current.thoi_gian,
        thoiGian ?? '',
        TypeDocumentDetailRow.text,
      ),
      DocumentDetailRow(
        S.current.nd_thu_hoi,
        noiDungThuHoi??'',
        TypeDocumentDetailRow.text,
      ),
      DocumentDetailRow(
        S.current.nguoi_bi_thu_hoi,
        nguoiBiThuHoi??'',
        TypeDocumentDetailRow.text,
      ),
      DocumentDetailRow(
        S.current.dv_bi_thu_hoi,
        donViBiThuHoi??'',
        TypeDocumentDetailRow.text,
      ),
      DocumentDetailRow(
        S.current.file_dinh_kem,
        files ?? [],
        TypeDocumentDetailRow.fileVanBanDi,
      ),
    ];
    return list;
  }
}

class Files {
  String? id;
  String? ten;
  String? duongDan;
  String? duoiMoRong;
  String? dungLuong;
  String? kieuDinhKem;

  Files(
      {this.id,
      this.ten,
      this.duongDan,
      this.duoiMoRong,
      this.dungLuong,
      this.kieuDinhKem});
}
