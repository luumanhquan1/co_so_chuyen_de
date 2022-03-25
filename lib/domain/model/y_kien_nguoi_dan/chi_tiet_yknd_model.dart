enum DoiTuongType { CANHAN, DOANHNGHIEP, TOCHUC, COQUANNHANUOC }

class ChiTietYKNDModel {
  HeaderChiTietYKNDModel headerChiTietYKNDModel;
  NguoiPhanAnhModel nguoiPhanAnhModel;

  ChiTietYKNDModel({required this.headerChiTietYKNDModel, required this.nguoiPhanAnhModel});
}

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

class DataRowChiTietKienNghi {
  final String title;
  final String? content;

  DataRowChiTietKienNghi({required this.title, this.content});
}

class NguoiPhanAnhModel {
  int? doiTuong;
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

class ThongTinXuLy {
  String? tenDonVi;
  String? vaiTro;

  ThongTinXuLy({this.vaiTro, this.tenDonVi});
}

class KetQuaXuLy {
  final String? yKienXuLy;
  final String? thoiGianThaoTac;
  final String? donViThaoTac;
  final String? taiKhoanThaoTac;
  final String? trangThaiXuLy;
  final String? noiDungXuLy;
  final String? fileDinhKem;

  KetQuaXuLy({
    this.yKienXuLy,
    this.thoiGianThaoTac,
    this.donViThaoTac,
    this.taiKhoanThaoTac,
    this.trangThaiXuLy,
    this.noiDungXuLy,
    this.fileDinhKem,
  });
}
