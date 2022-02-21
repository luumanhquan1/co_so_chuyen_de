import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/calender_work/bloc/calender_cubit.dart';
import 'package:ccvc_mobile/presentation/calender_work/ui/mobile/menu/item_state_lich_duoc_moi.dart';
import 'package:ccvc_mobile/presentation/calender_work/ui/widget/container_menu_widget.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum ItemMenu { Item1, Item2, Item3 }

class ItemThongBaoModel {
  String icon;
  String name;
  TypeContainer type;
  int? index;
  List<ItemThongBaoModel>? listWidget;
  ItemMenu? itemMenu;
  Function(BuildContext context, CalenderCubit cubit) onTap;

  ItemThongBaoModel({
    required this.icon,
    required this.name,
    required this.type,
    required this.onTap,
    this.index,
    this.listWidget,
    this.itemMenu,
  });
}

List<ItemThongBaoModel> listThongBao = [
  ItemThongBaoModel(
    icon: ImageAssets.icPerson,
    name: S.current.lich_cua_toi,
    type: TypeContainer.number,
    index: 3,
    itemMenu: ItemMenu.Item1,
    onTap: (BuildContext context, CalenderCubit cubit) {
      cubit.changeScreenMenu(S.current.lich_cua_toi);
      Navigator.pop(context);
    },
  ),
  ItemThongBaoModel(
    icon: ImageAssets.icLichTheoTrangThai,
    name: S.current.lich_theo_trang_thai,
    type: TypeContainer.expand,
    itemMenu: ItemMenu.Item2,
    listWidget: listTheoTrangThai,
    onTap: (BuildContext context, CalenderCubit cubit) {},
  ),
  ItemThongBaoModel(
    icon: ImageAssets.icLichLanhDao,
    name: S.current.lich_theo_lanh_dao,
    type: TypeContainer.expand,
    itemMenu: ItemMenu.Item3,
    listWidget: listLanhDao,
    onTap: (BuildContext context, CalenderCubit cubit) {},
  ),
];

List<ItemThongBaoModel> listThongBaoTablet = [
  ItemThongBaoModel(
    icon: ImageAssets.icPersonWork,
    name: S.current.lich_cua_toi,
    type: TypeContainer.number,
    index: 3,
    itemMenu: ItemMenu.Item1,
    onTap: (BuildContext context, CalenderCubit cubit) {
      cubit.changeScreenMenu(S.current.lich_cua_toi);
      Navigator.pop(context);
    },
  ),
  ItemThongBaoModel(
    icon: ImageAssets.icTheoDangLichCir,
    name: S.current.lich_theo_trang_thai,
    type: TypeContainer.expand,
    itemMenu: ItemMenu.Item2,
    listWidget: listTheoTrangThai,
    onTap: (BuildContext context, CalenderCubit cubit) {},
  ),
  ItemThongBaoModel(
    icon: ImageAssets.icLichLanhDaoCir,
    name: S.current.lich_theo_lanh_dao,
    type: TypeContainer.expand,
    itemMenu: ItemMenu.Item3,
    listWidget: listLanhDao,
    onTap: (BuildContext context, CalenderCubit cubit) {},
  ),
];

List<ItemThongBaoModel> listTheoTrangThai = [
  ItemThongBaoModel(
    icon: '',
    name: S.current.lich_duoc_moi,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, CalenderCubit cubit) {
      cubit.changeScreenMenu(S.current.lich_duoc_moi);
      Navigator.pop(context);
    },
  ),
  ItemThongBaoModel(
    icon: '',
    name: S.current.lich_tao_ho,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, CalenderCubit cubit) {
      cubit.changeScreenMenu(S.current.lich_tao_ho);
      Navigator.pop(context);
    },
  ),
  ItemThongBaoModel(
    icon: '',
    name: S.current.lich_huy,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, CalenderCubit cubit) {},
  ),
  ItemThongBaoModel(
    icon: '',
    name: S.current.lich_thu_hoi,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, CalenderCubit cubit) {},
  ),
  ItemThongBaoModel(
    icon: '',
    name: S.current.lich_da_co_bao_cao,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, CalenderCubit cubit) {},
  ),
  ItemThongBaoModel(
    icon: '',
    name: S.current.lich_chua_co_bao_cao,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, CalenderCubit cubit) {},
  ),
];

List<ItemThongBaoModel> listLanhDao = [
  ItemThongBaoModel(
    icon: '',
    name: S.current.lanh_dao_ubnd_tinh,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, CalenderCubit cubit) {},
  ),
  ItemThongBaoModel(
    icon: '',
    name: S.current.van_phong_ubnd_tinh,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, CalenderCubit cubit) {},
  ),
  ItemThongBaoModel(
    icon: '',
    name: S.current.so_ke_hoach_va_dau_tu,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, CalenderCubit cubit) {},
  ),
  ItemThongBaoModel(
    icon: '',
    name: S.current.so_noi_vu,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, CalenderCubit cubit) {},
  ),
  ItemThongBaoModel(
    icon: '',
    name: S.current.phong_tai_chinh_noi_chinh,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, CalenderCubit cubit) {},
  ),
  ItemThongBaoModel(
    icon: '',
    name: S.current.phong_kinh_te_nghanh,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, CalenderCubit cubit) {},
  ),
  ItemThongBaoModel(
    icon: '',
    name: S.current.so_tai_chinh,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, CalenderCubit cubit) {},
  ),
  ItemThongBaoModel(
    icon: '',
    name: S.current.so_noi_vu,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, CalenderCubit cubit) {},
  ),
];

extension GetScreenMenu on String {
  Widget getHeader({
    required CalenderCubit cubit,
  }) {
    switch (this) {
      case 'Lịch của tôi':
        return Padding(
          padding: const EdgeInsets.only(right: 16.0, top: 16.0, bottom: 16.0),
          child: Text(
            cubit.textDay,
            style: textNormalCustom(color: textBodyTime),
          ),
        );

      case 'Lịch được mời':
        return Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 16.0,
                  top: 16.0,
                  bottom: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cubit.textDay,
                      style: textNormalCustom(color: textBodyTime),
                    ),
                    stateLDM.ChoXacNhan.getState(3),
                  ],
                ),
              ),
            ],
          ),
        );

      case 'Lịch tạo hộ':
        return Padding(
          padding: const EdgeInsets.only(right: 16.0, top: 16.0, bottom: 16.0),
          child: Text(
            cubit.textDay,
            style: textNormalCustom(color: textBodyTime),
          ),
        );

      default:
        return Padding(
          padding: const EdgeInsets.only(right: 16.0, top: 16.0, bottom: 16.0),
          child: Text(
            cubit.textDay,
            style: textNormalCustom(color: textBodyTime),
          ),
        );
    }
  }

  Widget getHeaderTablet({
    required bool isHindText,
    required CalenderCubit cubit,
  }) {
    switch (this) {
      case 'Lịch của tôi':
        return isHindText
            ? Container()
            : Container(
                padding: const EdgeInsets.only(bottom: 28),
                child: Text(
                  cubit.textDay,
                  style: textNormalCustom(color: textBodyTime),
                ),
              );

      case 'Lịch được mời':
        return isHindText
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  stateLDM.ChoXacNhan.getState(3),
                ],
              )
            : Container(
                padding: const EdgeInsets.only(bottom: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cubit.textDay,
                      style: textNormalCustom(color: textBodyTime),
                    ),
                    stateLDM.ChoXacNhan.getState(3),
                  ],
                ),
              );

      case 'Lịch tạo hộ':
        return isHindText
            ? Container()
            : Container(
                padding: const EdgeInsets.only(bottom: 28),
                child: Text(
                  cubit.textDay,
                  style: textNormalCustom(color: textBodyTime),
                ),
              );

      default:
        return isHindText
            ? Container()
            : Container(
                padding: const EdgeInsets.only(bottom: 28),
                child: Text(
                  cubit.textDay,
                  style: textNormalCustom(color: textBodyTime),
                ),
              );
    }
  }
}
