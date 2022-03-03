import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/cupertino.dart';

enum KetThuc {
  taomoinv,
  ketluanch,
  guimail,
  thuhoi,
  xoa,
}

enum ChiTietLichHop {
  huyLichHop,
  xoaLich,
  suaLich,
  thuhoi,
  phanCongThuKy,
  taoBocBang
}

List<KetThucView> listKetThucView = [
  KetThucView(
    ImageAssets.ic_chitet,
    S.current.tao_moi_nhiem_vu,
    KetThuc.taomoinv,
  ),
  KetThucView(
    ImageAssets.ic_baocao,
    S.current.gui_mail_ket_luan,
    KetThuc.ketluanch,
  ),
  KetThucView(ImageAssets.icDeleteRed, S.current.gui_email, KetThuc.guimail),
  KetThucView(ImageAssets.icDeleteRed, S.current.thu_hoi, KetThuc.thuhoi),
  KetThucView(ImageAssets.icDeleteRed, S.current.xoa, KetThuc.xoa),
];

List<MenuChiTietLichHopView> listChiTietLichHop = [
  MenuChiTietLichHopView(
    ImageAssets.ic_baocao,
    S.current.huy_lich_hop,
    ChiTietLichHop.huyLichHop,
  ),
  MenuChiTietLichHopView(
      ImageAssets.ic_chitet, S.current.xoa_lich, ChiTietLichHop.xoaLich),
  MenuChiTietLichHopView(
      ImageAssets.ic_chitet, S.current.sua_lich, ChiTietLichHop.suaLich),
  MenuChiTietLichHopView(
      ImageAssets.ic_baocao, S.current.thu_hoi, ChiTietLichHop.thuhoi),
  MenuChiTietLichHopView(ImageAssets.ic_baocao, S.current.phan_cong_thu_ky,
      ChiTietLichHop.phanCongThuKy),
  MenuChiTietLichHopView(ImageAssets.ic_chitet, S.current.tao_boc_bang_cuoc_hop,
      ChiTietLichHop.taoBocBang),
];

extension GetScreen on KetThuc {
  Widget getScreen() {
    switch (this) {
      case KetThuc.taomoinv:
        return Container();

      case KetThuc.ketluanch:
        return Container();

      case KetThuc.guimail:
        return Container();

      case KetThuc.thuhoi:
        return Container();

      case KetThuc.xoa:
        return Container();
    }
  }

  Widget getScreenTablet() {
    switch (this) {
      case KetThuc.taomoinv:
        return Container();
      case KetThuc.ketluanch:
        return Container();

      case KetThuc.guimail:
        return Container();

      case KetThuc.thuhoi:
        return Container();

      case KetThuc.xoa:
        return Container();
    }
  }
}

extension GetScreenChiTietLichHop on ChiTietLichHop {


  Widget getScreenChiTietLichHop() {
    switch (this) {
      case ChiTietLichHop.huyLichHop:
        return Container();

      case ChiTietLichHop.xoaLich:
        return Container();

      case ChiTietLichHop.suaLich:
        return Container();

      case ChiTietLichHop.thuhoi:
        return Container();

      case ChiTietLichHop.phanCongThuKy:
        return Container();

      case ChiTietLichHop.taoBocBang:
        return Container();
    }
  }
}

class KetThucView {
  String icon;
  String name;
  KetThuc ketThuc;

  KetThucView(this.icon, this.name, this.ketThuc);
}

class MenuChiTietLichHopView {
  String icon;
  String name;
  ChiTietLichHop chiTietLichHop;

  MenuChiTietLichHopView(this.icon, this.name, this.chiTietLichHop);
}
