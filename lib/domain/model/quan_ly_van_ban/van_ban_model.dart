import 'package:ccvc_mobile/data/response/quan_ly_van_ban/ds_vbden_response.dart';

class VanBanModel {
  String? doKhan;
  String? loaiVanBan;
  String? ngayDen;
  String? nguoiSoanThao;

  VanBanModel({
    this.doKhan,
    this.loaiVanBan,
    this.ngayDen,
    this.nguoiSoanThao,
  });
}

class DanhSachVanBanModel {
  List<VanBanModel>? pageDataRespone;

  DanhSachVanBanModel({
    this.pageDataRespone,
  });
}