import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/menu/widget/container_menu_bao_chi.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_sach_cong_viec/bloc/danh_sach_cong_viec_tien_ich_cubit.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/cupertino.dart';

import 'container_menu_dscv.dart';

class ItemMenuDSCV {
  String icon;
  TypeMenuDSCV typeMenu;
  TypeContainer type;
  int? index;
  List<ItemMenuDSCV>? listWidget;
  Function(BuildContext context, DanhSachCongViecTienIchCubit cubit) onTap;

  ItemMenuDSCV({
    required this.icon,
    required this.typeMenu,
    required this.type,
    required this.onTap,
    this.index,
    this.listWidget,
  });
}

List<ItemMenuDSCV> listMenuDSCV = [
  ItemMenuDSCV(
    icon: ImageAssets.ic_nhomCVMoi,
    typeMenu: TypeMenuDSCV.NhomCVMoi,
    type: TypeContainer.expand,
    listWidget: listNhomCVMoi,
    onTap: (BuildContext context, DanhSachCongViecTienIchCubit cubit) {},
  ),
];

List<ItemMenuDSCV> listNhomCVMoi = [
  ItemMenuDSCV(
    icon: '',
    typeMenu: TypeMenuDSCV.CongViec1,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, DanhSachCongViecTienIchCubit cubit) {},
  ),
  ItemMenuDSCV(
    icon: '',
    typeMenu: TypeMenuDSCV.CongViec2,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, DanhSachCongViecTienIchCubit cubit) {},
  ),
];

enum TypeMenuDSCV {
  CongViecCuaBan,
  CongViecQuanTrong,
  DaHoanThanh,
  GanChoToi,
  DaBiXoa,
  NhomCVMoi,
  CongViec1,
  CongViec2,
  NhomCongViecMoi
}

extension GetScreenMenu on TypeMenuDSCV {
  String getTitle() {
    switch (this) {
      case TypeMenuDSCV.NhomCongViecMoi:
        return S.current.nhom_cong_viec_moi;
      case TypeMenuDSCV.CongViec1:
        return 'Công việc 1';
      case TypeMenuDSCV.CongViec2:
        return 'Công việc 1';
      default:
        return S.current.nhom_cong_viec_moi;
    }
  }
}
