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
  VanBanModel.empty();
}

class DanhSachVanBanModel {
  List<VanBanModel>? pageData;
  int? currentPage;
  int? pageSize;
  int? totalPage;
  int? totalRows;

  DanhSachVanBanModel(
      {this.pageData,
      this.currentPage,
      this.pageSize,
      this.totalPage,
      this.totalRows});
}
