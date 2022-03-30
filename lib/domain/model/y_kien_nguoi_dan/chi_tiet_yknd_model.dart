enum DoiTuongType { CANHAN, DOANHNGHIEP, TOCHUC, COQUANNHANUOC }

class ChiTietYKNDDataModel {
  ChiTietYKNDModel chiTietYKNDModel;

  ChiTietYKNDDataModel({required this.chiTietYKNDModel});
}

class ChiTietYKNDModel {
  String fileDinhKem;
  String taskFileDinhKem;
  String luongXuLy;
  String yKienChiDao;
  String task;
  String donViDuocPhanXuLy;
  bool isDuyet;
  bool isDraft;
  int linhVucId;
  String tenLuat;
  String phanLoaiPAKN;
  String soPAKN;
  String tieuDe;
  String noiDung;
  int nguonPAKNId;
  int luatId;
  int noiDungPAKNId;
  int linhVucPAKNId;
  String dSTaiLieuDinhKem;
  int doiTuongId;
  String tenNguoiPhanAnh;
  String cMTND;
  String email;
  String soDienThoai;
  String diaChi;
  int tinhId;
  int huyenId;
  int xaId;
  String donViXuLyId;
  int trangThai;
  String nguoiTaoId;
  String ngayNhan;
  String ngayPhanAnh;
  int noiTao;
  String diaChiChiTiet;
  String hanXuLy;
  String nguoiXuLyId;
  bool laPAKNChuyenLaiChoTiepNhan;
  bool laPAKNChuyenLaiChoChuyenXuLy;
  bool laPAKNChuyenLaiChoTiepNhanXuLy;
  String id;
  String thoiGianTaoMoi;
  String thoiGianCapNhat;
  String tenNguonPAKN;

  ChiTietYKNDModel(
    this.fileDinhKem,
    this.taskFileDinhKem,
    this.luongXuLy,
    this.yKienChiDao,
    this.task,
    this.donViDuocPhanXuLy,
    this.isDuyet,
    this.isDraft,
    this.linhVucId,
    this.tenLuat,
    this.phanLoaiPAKN,
    this.soPAKN,
    this.tieuDe,
    this.noiDung,
    this.nguonPAKNId,
    this.luatId,
    this.noiDungPAKNId,
    this.linhVucPAKNId,
    this.dSTaiLieuDinhKem,
    this.doiTuongId,
    this.tenNguoiPhanAnh,
    this.cMTND,
    this.email,
    this.soDienThoai,
    this.diaChi,
    this.tinhId,
    this.huyenId,
    this.xaId,
    this.donViXuLyId,
    this.trangThai,
    this.nguoiTaoId,
    this.ngayNhan,
    this.ngayPhanAnh,
    this.noiTao,
    this.diaChiChiTiet,
    this.hanXuLy,
    this.nguoiXuLyId,
    this.laPAKNChuyenLaiChoTiepNhan,
    this.laPAKNChuyenLaiChoChuyenXuLy,
    this.laPAKNChuyenLaiChoTiepNhanXuLy,
    this.id,
    this.thoiGianTaoMoi,
    this.thoiGianCapNhat,
    this.tenNguonPAKN,
  );
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

class FileData {
  int dungLuong;
  String duoiMoRong;
  String duongDan;
  String kieuDinhKem;
  String tenFile;

  FileData({
    required this.dungLuong,
    required this.duoiMoRong,
    required this.duongDan,
    required this.kieuDinhKem,
    required this.tenFile,
  });
}

class ChiTietYKienNguoiDanRow {
  final List<DataRowChiTietKienNghi> dataHeaderRow;
  final List<DataRowChiTietKienNghi> thongTinPhanAnhRow;
  final List<DataRowChiTietKienNghi> thomgTinXuLyRow;
  final List<DataRowChiTietKienNghi> ketQuaXuLyRow;
  final List<DataRowChiTietKienNghi> tienTrinhXuLy;

  ChiTietYKienNguoiDanRow(
    this.dataHeaderRow,
    this.thongTinPhanAnhRow,
    this.thomgTinXuLyRow,
    this.ketQuaXuLyRow,
    this.tienTrinhXuLy,
  );
}
