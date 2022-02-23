
class VanBanModel {
  String? iD;
  String? doKhan;
  String? loaiVanBan;
  String? ngayDen;
  String? nguoiSoanThao;

  VanBanModel({
    this.iD,
    this.doKhan,
    this.loaiVanBan,
    this.ngayDen,
    this.nguoiSoanThao,
  });
}

class DanhSachVanBanModel {
  List<VanBanModel>? pageData;

  DanhSachVanBanModel({
    this.pageData,
  });
}
