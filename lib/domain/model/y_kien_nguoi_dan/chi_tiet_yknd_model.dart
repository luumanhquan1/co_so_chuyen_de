enum DoiTuongType {CANHAN,DOANHNGHIEP,TOCHUC,COQUANNHANUOC}
class HeaderChiTietYKNDModel {
  final String? tieuDe;
  final String? noiDung;
  final String? nguonPAKN;
  final String? phanLoaiPAKN;
  final String? ngayPhanAnh;
  final String? hanXuLy;
  final String? quyDinhLuat;
  final String? taiLieuCongDan;

  HeaderChiTietYKNDModel({
    this.tieuDe,
    this.noiDung,
    this.nguonPAKN,
    this.phanLoaiPAKN,
    this.ngayPhanAnh,
    this.hanXuLy,
    this.quyDinhLuat,
    this.taiLieuCongDan,
  });
}

class DataHeader {
  final String title;
  final String? content;

  DataHeader({required this.title, this.content});
}

class NguoiPhanAnhModel {
  String? doiTuong;
  String? tenCaNhan;
  String? cmnd;
  String? diaChiEmail;
  String? soDienthoai;
  String? diaChiChiTiet;

  NguoiPhanAnhModel({
    this.doiTuong,
    this.tenCaNhan,
    this.cmnd,
    this.diaChiEmail,
    this.soDienthoai,
    this.diaChiChiTiet,
  });
}
