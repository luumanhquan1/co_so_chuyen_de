import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/ket_noi_module/config/resources/color.dart';
import 'package:ccvc_mobile/ket_noi_module/config/resources/styles.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/danh_sach_chung/bloc/ket_noi_cubit.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/menu/ui/widget/container_ket_noi_menu.dart';
import 'package:ccvc_mobile/ket_noi_module/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';

class ItemKetNoiModel {
  String icon;
  TypeKetNoiMenu typeMenu;
  TypeContainer type;
  int? index;
  List<ItemKetNoiModel>? listWidget;
  Function(BuildContext context, KetNoiCubit cubit) onTap;

  ItemKetNoiModel({
    required this.icon,
    required this.typeMenu,
    required this.type,
    required this.onTap,
    this.index,
    this.listWidget,
  });
}

List<ItemKetNoiModel> listKetNoi = [
  ItemKetNoiModel(
    icon: ImageAssets.ic_wifi,
    typeMenu: TypeKetNoiMenu.SuKien,
    type: TypeContainer.expand,
    listWidget: listSuKien,
    onTap: (BuildContext context, KetNoiCubit cubit) {},
  ),
  ItemKetNoiModel(
    icon: ImageAssets.ic_wifi,
    typeMenu: TypeKetNoiMenu.KetNoi,
    type: TypeContainer.expand,
    listWidget: listKetNoi2,
    onTap: (BuildContext context, KetNoiCubit cubit) {},
  ),
];
List<ItemKetNoiModel> listSuKien = [
  ItemKetNoiModel(
    icon: '',
    typeMenu: TypeKetNoiMenu.Chung,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, KetNoiCubit cubit) {
      cubit.changeScreenMenu(TypeKetNoiMenu.Chung);
      Navigator.pop(context);
    },
  ),
  ItemKetNoiModel(
    icon: '',
    typeMenu: TypeKetNoiMenu.SuKiens,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, KetNoiCubit cubit) {
      cubit.changeScreenMenu(TypeKetNoiMenu.SuKiens);
      Navigator.pop(context);
    },
  ),
  ItemKetNoiModel(
    icon: '',
    typeMenu: TypeKetNoiMenu.TrongNuoc,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, KetNoiCubit cubit) {
      cubit.changeScreenMenu(TypeKetNoiMenu.TrongNuoc);
      Navigator.pop(context);
    },
  ),
  ItemKetNoiModel(
    icon: '',
    typeMenu: TypeKetNoiMenu.NuocNgoai,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, KetNoiCubit cubit) {
      cubit.changeScreenMenu(TypeKetNoiMenu.NuocNgoai);
      Navigator.pop(context);
    },
  ),
  ItemKetNoiModel(
    icon: '',
    typeMenu: TypeKetNoiMenu.PhatDong,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, KetNoiCubit cubit) {
      cubit.changeScreenMenu(TypeKetNoiMenu.PhatDong);
      Navigator.pop(context);
    },
  ),
  ItemKetNoiModel(
    icon: '',
    typeMenu: TypeKetNoiMenu.ThamDu,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, KetNoiCubit cubit) {
      cubit.changeScreenMenu(TypeKetNoiMenu.ThamDu);
      Navigator.pop(context);
    },
  ),
  ItemKetNoiModel(
    icon: '',
    typeMenu: TypeKetNoiMenu.DuocMoi,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, KetNoiCubit cubit) {
      cubit.changeScreenMenu(TypeKetNoiMenu.DuocMoi);
      Navigator.pop(context);
    },
  ),
];
List<ItemKetNoiModel> listKetNoi2 = [
  ItemKetNoiModel(
    icon: '',
    typeMenu: TypeKetNoiMenu.QuocTes,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, KetNoiCubit cubit) {
      // cubit.changeScreenMenu();
      Navigator.pop(context);
    },
  ),
  ItemKetNoiModel(
    icon: '',
    typeMenu: TypeKetNoiMenu.TrongNuocs,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, KetNoiCubit cubit) {
      //  cubit.changeScreenMenu(TypeCalendarMenu.LichDuocMoi);
      Navigator.pop(context);
    },
  ),
];
enum TypeKetNoiMenu {
  SuKien,
  Chung,
  SuKiens,
  TrongNuoc,
  NuocNgoai,
  PhatDong,
  ThamDu,
  DuocMoi,
  KetNoi,
  QuocTes,
  TrongNuocs
}

extension GetScreenMenu on TypeKetNoiMenu {
  String getTitle() {
    switch (this) {
      case TypeKetNoiMenu.SuKien:
        return S.current.su_kien;

      case TypeKetNoiMenu.Chung:
        return S.current.chung;

      case TypeKetNoiMenu.SuKiens:
        return S.current.su_kien;

      case TypeKetNoiMenu.TrongNuoc:
        return S.current.trong_nuoc;

      case TypeKetNoiMenu.NuocNgoai:
        return S.current.nuoc_ngoai;

      case TypeKetNoiMenu.PhatDong:
        return S.current.phat_dong;
      case TypeKetNoiMenu.ThamDu:
        return S.current.tham_du;

      case TypeKetNoiMenu.DuocMoi:
        return S.current.duoc_moi;

      case TypeKetNoiMenu.KetNoi:
        return S.current.ket_noi;

      case TypeKetNoiMenu.QuocTes:
        return S.current.quoc_te;

      case TypeKetNoiMenu.TrongNuocs:
        return S.current.trong_nuoc;
      default:
        return S.current.su_kien;
    }
  }

  Widget getHeader({
    required KetNoiCubit cubit,
  }) {
    switch (this) {
      case TypeKetNoiMenu.Chung:
        return Padding(
          padding: const EdgeInsets.only(right: 16.0, top: 16.0, bottom: 16.0),
          child: Text(
            cubit.textDay,
            style: textNormalCustom(color: textBodyTime),
          ),
        );

      case TypeKetNoiMenu.SuKiens:
        return Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
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
                  ],
                ),
              ),
            ],
          ),
        );

      case TypeKetNoiMenu.TrongNuoc:
        return Padding(
          padding: const EdgeInsets.only(right: 16.0, top: 32.0, bottom: 16.0),
          child: Text(
            cubit.textDay,
            style: textNormalCustom(color: textBodyTime),
          ),
        );

      default:
        return Padding(
          padding: const EdgeInsets.only(right: 16.0, top: 32.0, bottom: 16.0),
          child: Text(
            cubit.textDay,
            style: textNormalCustom(color: textBodyTime),
          ),
        );
    }
  }
}
