import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/van_ban_lien_quan.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/chi_tiet_nhiem_vu/ui/type_data_row.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';

class LichSuPhanXuLyNhiemVuModel {
  String? id;
  int? stt;
  String? nguoiGui;
  String? donViGui;
  String? thoiGian;
  String? nguoiNhan;
  String? donViNhan;
  String? vaiTroXuLy;
  String? trangThai;
  String? trangThaiId;

  LichSuPhanXuLyNhiemVuModel.empty();

  LichSuPhanXuLyNhiemVuModel({
    this.id,
    this.stt,
    this.nguoiGui,
    this.donViGui,
    this.thoiGian,
    this.nguoiNhan,
    this.donViNhan,
    this.vaiTroXuLy,
    this.trangThai,
    this.trangThaiId,
  });

  List<RowDataExpandModel> listLSPXL() {
    List<RowDataExpandModel> listData = [
      RowDataExpandModel(
        key: S.current.stt,
        value: stt.toString(),
        type: TypeDataNV.text,
      ),
      RowDataExpandModel(
        key: S.current.nguoi_gui,
        value: nguoiGui ?? '',
        type: TypeDataNV.text,
      ),
      RowDataExpandModel(
        key: S.current.thoi_gian,
        value: thoiGian ?? '',
        type: TypeDataNV.text,
      ),
      RowDataExpandModel(
        key: S.current.nguoi_nhan,
        value: nguoiNhan ?? '',
        type: TypeDataNV.text,
      ),
      RowDataExpandModel(
        key: S.current.don_vi_nhan,
        value: donViNhan ?? '',
        type: TypeDataNV.text,
      ),
      RowDataExpandModel(
        key: S.current.vai_tro_xu_ly,
        value: vaiTroXuLy ?? '',
        type: TypeDataNV.text,
      ),
      RowDataExpandModel(
        key: S.current.trang_thai,
        value:
            trangThai?.split(' ').join('_').toUpperCase().vietNameseParse() ??
                '',
        type: TypeDataNV.status,
      ),
    ];
    return listData;
  }
}
