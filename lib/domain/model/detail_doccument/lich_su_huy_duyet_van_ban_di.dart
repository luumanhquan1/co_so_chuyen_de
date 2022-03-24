import 'package:ccvc_mobile/domain/model/detail_doccument/lich_su_thu_hoi_van_ban_di_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/document_detail_row.dart';

class DataLichSuHuyDuyetVanBanDi {
  String? messages;
  List<LichSuHuyDuyetVanBanDi>? data;
  String? validationResult;
  bool? isSuccess;

  DataLichSuHuyDuyetVanBanDi({
    this.messages,
    this.data,
    this.validationResult,
    this.isSuccess,
  });
}

class LichSuHuyDuyetVanBanDi {
  String? canBo;
  String? donVi;
  String? thoiGian;
  String? noiDungCapNhat;
  List<Files>? files;

  LichSuHuyDuyetVanBanDi({
    this.canBo,
    this.donVi,
    this.thoiGian,
    this.noiDungCapNhat,
    this.files,
  });

  List<DocumentDetailRow> toListRowHuyDuyet() {
    final List<DocumentDetailRow> list = [
      DocumentDetailRow(
        S.current.can_bo,
        canBo ?? '',
        TypeDocumentDetailRow.text,
      ),
      DocumentDetailRow(
        S.current.don_vi,
        donVi ?? '',
        TypeDocumentDetailRow.text,
      ),
      DocumentDetailRow(
        S.current.thoi_gian,
        thoiGian ?? '',
        TypeDocumentDetailRow.text,
      ),
      DocumentDetailRow(
        S.current.nd_huy_duyet,
        noiDungCapNhat ?? '',
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
    switch (number) {
      case 0:
        return S.current.trinh_ky;
      case 1:
        return S.current.duyet;
    }
    return '';
  }
}
