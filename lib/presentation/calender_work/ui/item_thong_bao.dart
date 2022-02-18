import 'package:ccvc_mobile/generated/l10n.dart';

class ItemThongBao {
  String name;
  int index;
  Function navigator;

  ItemThongBao({
    required this.name,
    required this.index,
    required this.navigator,
  });
}

List<ItemThongBao> lichTheoTrangThai = [
  ItemThongBao(name: S.current.lich_duoc_moi, index: 12, navigator: () {}),
  ItemThongBao(name: S.current.lich_tao_ho, index: 12, navigator: () {}),
  ItemThongBao(name: S.current.lich_huy, index: 12, navigator: () {}),
  ItemThongBao(name: S.current.lich_thu_hoi, index: 12, navigator: () {}),
  ItemThongBao(name: S.current.lich_da_co_bao_cao, index: 12, navigator: () {}),
  ItemThongBao(
    name: S.current.lich_chua_co_bao_cao,
    index: 12,
    navigator: () {},
  ),
];

List<ItemThongBao> lichLanhDao = [
  ItemThongBao(name: S.current.lanh_dao_ubnd_tinh, index: 12, navigator: () {}),
  ItemThongBao(
    name: S.current.van_phong_ubnd_tinh,
    index: 12,
    navigator: () {},
  ),
  ItemThongBao(
    name: S.current.so_ke_hoach_va_dau_tu,
    index: 12,
    navigator: () {},
  ),
  ItemThongBao(name: S.current.so_noi_vu, index: 12, navigator: () {}),
  ItemThongBao(
    name: S.current.phong_tai_chinh_noi_chinh,
    index: 12,
    navigator: () {},
  ),
  ItemThongBao(
    name: S.current.phong_kinh_te_nghanh,
    index: 12,
    navigator: () {},
  ),
  ItemThongBao(name: S.current.so_tai_chinh, index: 12, navigator: () {}),
];
