import 'package:ccvc_mobile/domain/model/lich_hop/dash_board_lich_hop.dart';
import 'package:ccvc_mobile/presentation/calender_work/ui/item_thong_bao.dart';
import 'package:ccvc_mobile/presentation/calender_work/ui/widget/container_menu_widget.dart';
import 'package:ccvc_mobile/presentation/lich_hop/bloc/lich_hop_cubit.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemThongBaoModelMyCalender {
  String icon;
  TypeCalendarMenu typeMenu;
  TypeContainer type;
  int? index;
  List<ItemThongBaoModelMyCalender>? listWidget;
  Function(BuildContext context, LichHopCubit cubit) onTap;

  ItemThongBaoModelMyCalender({
    required this.icon,
    required this.typeMenu,
    required this.type,
    required this.onTap,
    this.index,
    this.listWidget,
  });
}

List<ItemThongBaoModelMyCalender> listThongBaoMyCalendar = [
  ItemThongBaoModelMyCalender(
    icon: ImageAssets.icPerson,
    typeMenu: TypeCalendarMenu.LichCuaToi,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, LichHopCubit cubit) {},
  ),
  ItemThongBaoModelMyCalender(
    icon: ImageAssets.icLichTheoTrangThai,
    typeMenu: TypeCalendarMenu.LichTheoTrangThai,
    type: TypeContainer.expand,
    listWidget: listTheoTrangThaiLichHop,
    onTap: (BuildContext context, LichHopCubit cubit) {},
  ),
  ItemThongBaoModelMyCalender(
    icon: ImageAssets.icLichTheoTrangThai,
    typeMenu: TypeCalendarMenu.LichHopLanhDao,
    type: TypeContainer.expand,
    listWidget: listTheoTrangThaiLichHop,
    onTap: (BuildContext context, LichHopCubit cubit) {},
  ),
];

List<ItemThongBaoModelMyCalender> listTheoTrangThaiLichHop = [
  ItemThongBaoModelMyCalender(
    icon: '',
    typeMenu: TypeCalendarMenu.LichDuocMoi,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, LichHopCubit cubit) {},
  ),
  ItemThongBaoModelMyCalender(
    icon: '',
    typeMenu: TypeCalendarMenu.LichTaoHo,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, LichHopCubit cubit) {},
  ),
  ItemThongBaoModelMyCalender(
    icon: '',
    typeMenu: TypeCalendarMenu.LichHuy,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, LichHopCubit cubit) {},
  ),
  ItemThongBaoModelMyCalender(
    icon: '',
    typeMenu: TypeCalendarMenu.LichThuHoi,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, LichHopCubit cubit) {},
  ),
  ItemThongBaoModelMyCalender(
    icon: '',
    typeMenu: TypeCalendarMenu.LichHopCanKLCH,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, LichHopCubit cubit) {},
  ),
  ItemThongBaoModelMyCalender(
    icon: '',
    typeMenu: TypeCalendarMenu.LichDaKLCH,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, LichHopCubit cubit) {},
  ),
];

extension GetDataMenu on TypeCalendarMenu {
  int getIndexMenuLichHop(DashBoardLichHopModel data) {
    switch (this) {
      case TypeCalendarMenu.LichCuaToi:
        return data.countScheduleCaNhan ?? 0;
      case TypeCalendarMenu.LichTaoHo:
        return data.soLichTaoHo ?? 0;
      case TypeCalendarMenu.LichHuy:
        return data.soLichHuyBo ?? 0;
      case TypeCalendarMenu.LichThuHoi:
        return data.soLichThuHoi ?? 0;
      case TypeCalendarMenu.LichDaCoBaoCao:
        return data.soLichCoBaoCaoDaDuyet ?? 0;
      case TypeCalendarMenu.LichChuaCoBaoCao:
        return data.soLichChuaCoBaoCao ?? 0;
      case TypeCalendarMenu.LichDuocMoi:
        return data.tongLichDuocMoi ?? 0;
      case TypeCalendarMenu.LichHopCanKLCH:
        return data.soLichChuaCoBaoCao ?? 0;
      case TypeCalendarMenu.LichDaKLCH:
        return data.tongSoLichCoBaoCao ?? 0;
      default:
        return 0;
    }
  }
}

