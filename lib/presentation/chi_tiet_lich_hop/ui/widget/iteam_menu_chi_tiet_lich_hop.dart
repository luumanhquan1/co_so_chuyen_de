import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_lich_hop/ui/widget/phan_cong_thu_ky.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_lich_hop/ui/widget/thu_hoi_lich_widget.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_lich_hop/ui/widget/tao_boc_bang_widget.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/cupertino.dart';

enum ChiTietLichHop {
  huyLichHop,
  xoaLich,
  suaLich,
  thuhoi,
  phanCongThuKy,
  taoBocBang
}

List<MenuChiTietLichHopView> listChiTietLichHop = [
  MenuChiTietLichHopView(ImageAssets.icmot, S.current.huy_lich_hop,
      ChiTietLichHop.huyLichHop),
  MenuChiTietLichHopView(
      ImageAssets.icHai, S.current.xoa_lich, ChiTietLichHop.xoaLich),
  MenuChiTietLichHopView(
      ImageAssets.icba, S.current.sua_lich, ChiTietLichHop.suaLich),
  MenuChiTietLichHopView(
      ImageAssets.ic4, S.current.thu_hoi, ChiTietLichHop.thuhoi),
  MenuChiTietLichHopView(ImageAssets.icNam, S.current.phan_cong_thu_ky,
      ChiTietLichHop.phanCongThuKy),
  MenuChiTietLichHopView(ImageAssets.icSau, S.current.tao_boc_bang_cuoc_hop,
      ChiTietLichHop.taoBocBang),
];

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
        return const ThuHoiLichWidget();


      case ChiTietLichHop.phanCongThuKy:
        return const PhanCongThuKyWidget();


      case ChiTietLichHop.taoBocBang:
        return const TaoBocBangWidget();

    }
  }
}

class MenuChiTietLichHopView {
  String icon;
  String name;
  ChiTietLichHop chiTietLichHop;

  MenuChiTietLichHopView(this.icon, this.name, this.chiTietLichHop);
}
