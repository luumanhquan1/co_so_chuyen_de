import 'package:ccvc_mobile/data/response/quan_ly_van_ban/danh_sach_van_ban/ds_vbden_response.dart';
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
  List<PageDataResponseVBDen>? pageDataRespone;

  DanhSachVanBanModel({
    this.pageDataRespone,
  });
}
