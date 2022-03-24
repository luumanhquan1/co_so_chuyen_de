import 'package:ccvc_mobile/domain/model/detail_doccument/lich_su_thu_hoi_van_ban_di_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/document_detail_row.dart';

class DataLichSuKyDuyetVanBanDi {
  String? messages;
  List<LichSuKyDuyetVanBanDi>? data;
  String? validationResult;
  bool? isSuccess;

  DataLichSuKyDuyetVanBanDi({
    this.messages,
    this.data,
    this.validationResult,
    this.isSuccess,
  });
}

class LichSuKyDuyetVanBanDi {
  String? nguoiGui;
  String? donViGui;
  String? thoiGian;
  String? nguoiNhan;
  String? donViNhan;
  int? action;
  String? noiDungCapNhat;
  List<Files>? files;

  LichSuKyDuyetVanBanDi({
    this.nguoiGui,
    this.donViGui,
    this.thoiGian,
    this.nguoiNhan,
    this.donViNhan,
    this.action,
    this.noiDungCapNhat,
    this.files,
  });

  List<DocumentDetailRow> toListRowKyDuyet() {
    final List<DocumentDetailRow> list = [
      DocumentDetailRow(
        S.current.don_vi_gui,
        donViGui ?? '',
        TypeDocumentDetailRow.text,
      ),
      DocumentDetailRow(
        S.current.nd_ky_duyet,
        noiDungCapNhat ?? '',
        TypeDocumentDetailRow.text,
      ),
      DocumentDetailRow(
        S.current.don_vi_nhan,
        donViNhan ?? '',
        TypeDocumentDetailRow.text,
      ),

      DocumentDetailRow(
        S.current.nguoi_gui,
        nguoiGui ?? '',
        TypeDocumentDetailRow.text,
      ),
      DocumentDetailRow(
        S.current.nguoi_nhan,
        nguoiNhan ?? '',
        TypeDocumentDetailRow.text,
      ),
      DocumentDetailRow(
        S.current.thoi_gian,
        thoiGian ?? '',
        TypeDocumentDetailRow.text,
      ),
      DocumentDetailRow(
        S.current.trang_thai,
        trangThaiDuyet(action??0),
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
  String trangThaiDuyet(int number) {
    switch(number){
      case 0:
        return S.current.trinh_ky;
      case 1:
        return S.current.duyet;
    }
    return '';

  }
}
