
import 'package:ccvc_mobile/data/response/quan_ly_van_ban/data_vb_item.dart';
class VBItemModel {
  String? doKhan = '';
  String?  loaiVanBan= '';
  String? ngayTao = '';
  String? nguoiSoanThao='';
  VBItemModel({this.doKhan,this.loaiVanBan,this.ngayTao,this.nguoiSoanThao});
}
class DanhSachVanBanModel{
  List<DataVanBanResponse>?  listVB;
  DanhSachVanBanModel({this.listVB});
}

