import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/dash_board_lich_hop.dart';
import 'package:ccvc_mobile/domain/model/manager_personal_information/manager_personal_information_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/calender_work/ui/item_thong_bao.dart';
import 'package:ccvc_mobile/presentation/calender_work/ui/widget/container_menu_widget.dart';
import 'package:ccvc_mobile/presentation/lich_hop/bloc/lich_hop_cubit.dart';
import 'package:ccvc_mobile/presentation/lich_hop/ui/widget/state_select_lich_hop_widget.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'mobile/lich_hop_extension.dart';

class ItemThongBaoModelMyCalender {
  String icon;
  TypeCalendarMenu typeMenu;
  TypeContainer type;
  int? index;
  List<ItemThongBaoModelMyCalender>? listWidget;
  Function(BuildContext context, LichHopCubit cubit) onTap;
  String name;

  ItemThongBaoModelMyCalender({
    required this.icon,
    required this.typeMenu,
    required this.type,
    required this.onTap,
    this.index,
    this.listWidget,
    this.name = '',
  });
}

List<ItemThongBaoModelMyCalender> listThongBaoMyCalendar = [
  ItemThongBaoModelMyCalender(
    icon: ImageAssets.icPerson,
    typeMenu: TypeCalendarMenu.LichCuaToi,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, LichHopCubit cubit) {
      cubit.changeScreenMenu(TypeCalendarMenu.LichCuaToi);
      Navigator.pop(context);
    },
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

List<ItemThongBaoModelMyCalender> listThongBaoMyCalendarTablet = [
  ItemThongBaoModelMyCalender(
    icon: ImageAssets.icPersonWork,
    typeMenu: TypeCalendarMenu.LichCuaToi,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, LichHopCubit cubit) {
      cubit.changeScreenMenu(TypeCalendarMenu.LichCuaToi);
      Navigator.pop(context);
    },
  ),
  ItemThongBaoModelMyCalender(
    icon: ImageAssets.icTheoDangLichCir,
    typeMenu: TypeCalendarMenu.LichTheoTrangThai,
    type: TypeContainer.expand,
    listWidget: listTheoTrangThaiLichHop,
    onTap: (BuildContext context, LichHopCubit cubit) {},
  ),
  ItemThongBaoModelMyCalender(
    icon: ImageAssets.icLichLanhDaoCir,
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
    onTap: (BuildContext context, LichHopCubit cubit) {
      cubit.changeScreenMenu(TypeCalendarMenu.LichDuocMoi);
      Navigator.pop(context);
    },
  ),
  ItemThongBaoModelMyCalender(
    icon: '',
    typeMenu: TypeCalendarMenu.LichTaoHo,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, LichHopCubit cubit) {
      cubit.changeScreenMenu(TypeCalendarMenu.LichTaoHo);
      Navigator.pop(context);
    },
  ),
  ItemThongBaoModelMyCalender(
    icon: '',
    typeMenu: TypeCalendarMenu.LichHuy,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, LichHopCubit cubit) {
      cubit.changeScreenMenu(TypeCalendarMenu.LichHuy);
      Navigator.pop(context);
    },
  ),
  ItemThongBaoModelMyCalender(
    icon: '',
    typeMenu: TypeCalendarMenu.LichThuHoi,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, LichHopCubit cubit) {
      cubit.changeScreenMenu(TypeCalendarMenu.LichThuHoi);
      Navigator.pop(context);
    },
  ),
  ItemThongBaoModelMyCalender(
    icon: '',
    typeMenu: TypeCalendarMenu.ChoDuyet,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, LichHopCubit cubit) {
      cubit.changeScreenMenu(TypeCalendarMenu.ChoDuyet);
      Navigator.pop(context);
    },
  ),
  ItemThongBaoModelMyCalender(
    icon: '',
    typeMenu: TypeCalendarMenu.LichHopCanKLCH,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, LichHopCubit cubit) {
      cubit.changeScreenMenu(TypeCalendarMenu.LichHopCanKLCH);
      Navigator.pop(context);
    },
  ),
  ItemThongBaoModelMyCalender(
    icon: '',
    typeMenu: TypeCalendarMenu.LichDaKLCH,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, LichHopCubit cubit) {
      cubit.changeScreenMenu(TypeCalendarMenu.LichDaKLCH);
      Navigator.pop(context);
    },
  ),
];

List<ItemThongBaoModelMyCalender> listLanhDaoLichHop = [
  ItemThongBaoModelMyCalender(
    icon: '',
    typeMenu: TypeCalendarMenu.LanhDaoUBNDTinh,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, LichHopCubit cubit) {},
  ),
  ItemThongBaoModelMyCalender(
    icon: '',
    typeMenu: TypeCalendarMenu.VanPhongUBNDTinh,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, LichHopCubit cubit) {},
  ),
  ItemThongBaoModelMyCalender(
    icon: '',
    typeMenu: TypeCalendarMenu.SoKeHoachDauVaDauTu,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, LichHopCubit cubit) {},
  ),
  ItemThongBaoModelMyCalender(
    icon: '',
    typeMenu: TypeCalendarMenu.SoNoiVu,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, LichHopCubit cubit) {},
  ),
  ItemThongBaoModelMyCalender(
    icon: '',
    typeMenu: TypeCalendarMenu.PhongTaiChinhNoiChinh,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, LichHopCubit cubit) {},
  ),
  ItemThongBaoModelMyCalender(
    icon: '',
    typeMenu: TypeCalendarMenu.PhongKinhTeNghanh,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, LichHopCubit cubit) {},
  ),
  ItemThongBaoModelMyCalender(
    icon: '',
    typeMenu: TypeCalendarMenu.SoTaiChinh,
    type: TypeContainer.number,
    index: 3,
    onTap: (BuildContext context, LichHopCubit cubit) {},
  ),
  ItemThongBaoModelMyCalender(
    icon: '',
    typeMenu: TypeCalendarMenu.SoNoiVu,
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

  Widget getHeaderLichHop({
    required LichHopCubit cubit,
    required Type_Choose_Option_Day type,
  }) {
    switch (this) {
      case TypeCalendarMenu.LichCuaToi:
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: type.getTextLHWidget(
            cubit: cubit,
            textColor: textBodyTime,
          ),
        );

      case TypeCalendarMenu.LichDuocMoi:
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: type.getTextLHWidget(
                        cubit: cubit,
                        textColor: textBodyTime,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    StateSelectLichHopWidget(cubit: cubit),
                  ],
                ),
              ),
            ],
          ),
        );

      case TypeCalendarMenu.LichTaoHo:
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: type.getTextLHWidget(
            cubit: cubit,
            textColor: textBodyTime,
          ),
        );

      default:
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Text(
            getDateToString(DateTime.now()),
            style: textNormalCustom(color: textBodyTime),
          ),
        );
    }
  }

  String getTitleLichHop() {
    switch (this) {
      case TypeCalendarMenu.LichCuaToi:
        return S.current.lich_hop_cua_toi;

      case TypeCalendarMenu.LichTheoTrangThai:
        return S.current.lich_theo_trang_thai;

      case TypeCalendarMenu.LichTheoLanhDao:
        return S.current.lich_theo_lanh_dao;

      case TypeCalendarMenu.LichDuocMoi:
        return S.current.lich_hop_duoc_moi;

      case TypeCalendarMenu.LichTaoHo:
        return S.current.lich_hop_tao_ho;

      case TypeCalendarMenu.LichHuy:
        return S.current.lich_hop_huy;
      case TypeCalendarMenu.LichChuaCoBaoCao:
        return S.current.lich_chua_co_bao_cao;

      case TypeCalendarMenu.LichThuHoi:
        return S.current.lich_hop_thu_hoi;

      case TypeCalendarMenu.LichDaCoBaoCao:
        return S.current.lich_da_co_bao_cao;

      case TypeCalendarMenu.LanhDaoUBNDTinh:
        return S.current.lanh_dao_ubnd_tinh;

      case TypeCalendarMenu.VanPhongUBNDTinh:
        return S.current.van_phong_ubnd_tinh;

      case TypeCalendarMenu.SoKeHoachDauVaDauTu:
        return S.current.so_ke_hoach_va_dau_tu;

      case TypeCalendarMenu.SoNoiVu:
        return S.current.so_noi_vu;

      case TypeCalendarMenu.PhongTaiChinhNoiChinh:
        return S.current.phong_tai_chinh_noi_chinh;

      case TypeCalendarMenu.PhongKinhTeNghanh:
        return S.current.phong_kinh_te_nghanh;

      case TypeCalendarMenu.SoTaiChinh:
        return S.current.so_tai_chinh;

      case TypeCalendarMenu.LichHopLanhDao:
        return S.current.lich_hop_lanh_dao;

      case TypeCalendarMenu.BaoCaoThongKe:
        return S.current.bao_cao_thong_ke;

      case TypeCalendarMenu.LichDaKLCH:
        return S.current.lich_da_klch;

      case TypeCalendarMenu.LichHopCanKLCH:
        return S.current.lich_hop_can_klch;

      case TypeCalendarMenu.ChoDuyet:
        return S.current.cho_duyet;

      default:
        return S.current.lich_cua_toi;
    }
  }

  Widget getHeaderTabletLichHop({
    required bool isHindText,
    required LichHopCubit cubit,
    required Type_Choose_Option_Day type,
  }) {
    switch (this) {
      case TypeCalendarMenu.LichCuaToi:
        return isHindText
            ? Container()
            : Container(
                padding: const EdgeInsets.only(bottom: 28),
                child: type.getTextLHWidget(
                  cubit: cubit,
                  textColor: textBodyTime,
                ),
              );

      case TypeCalendarMenu.LichDuocMoi:
        return isHindText
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  StateSelectLichHopWidget(cubit: cubit),
                ],
              )
            : Container(
                padding: const EdgeInsets.only(bottom: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    type.getTextLHWidget(
                      cubit: cubit,
                      textColor: textBodyTime,
                    ),
                    StateSelectLichHopWidget(cubit: cubit),
                  ],
                ),
              );

      case TypeCalendarMenu.LichTaoHo:
        return isHindText
            ? Container()
            : Container(
                padding: const EdgeInsets.only(bottom: 28),
                child: type.getTextLHWidget(
                  cubit: cubit,
                  textColor: textBodyTime,
                ),
              );

      default:
        return isHindText
            ? Container()
            : Container(
                padding: const EdgeInsets.only(bottom: 28),
                child: type.getTextLHWidget(
                  cubit: cubit,
                  textColor: textBodyTime,
                ),
              );
    }
  }
}
