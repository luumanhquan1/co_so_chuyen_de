import 'package:ccvc_mobile/data/response/quan_ly_van_ban/ds_vbdi_response.dart';

class VanBanDiModel {
  String? doKhan;
  String? loaiVanBan;
  String? ngayTao;
  String? nguoiSoanThao;

  VanBanDiModel({
    this.doKhan,
    this.loaiVanBan,
    this.ngayTao,
    this.nguoiSoanThao,
  });
}

class DanhSachVanBanDiModel {
  List<PageDataResponseVBDi>? pageDataRespone;

  DanhSachVanBanDiModel({
    this.pageDataRespone,
  });
}
