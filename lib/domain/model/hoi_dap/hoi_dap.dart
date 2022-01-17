import 'package:ccvc_mobile/generated/l10n.dart';

class HoiDap {
  String? tieuDe;

  String? chuDe;

  String? loaiHDSD;

  String? danhSach;

  String? noiDung;

  HoiDap({
    this.tieuDe = '',
    this.chuDe = '',
    this.loaiHDSD = '',
    this.danhSach = '',
    this.noiDung = '',
  });

  Map<String, dynamic> getInfoToMap() {
    return {
      S.current.tieu_de: tieuDe,
      S.current.chu_de_hdsd: chuDe,
      S.current.loai_hdsd: loaiHDSD,
      S.current.danhSach: danhSach,
      S.current.noi_dung: noiDung
    };
  }
}
