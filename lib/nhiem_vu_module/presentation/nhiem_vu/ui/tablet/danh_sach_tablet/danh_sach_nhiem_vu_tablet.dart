import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/danh_sach_nhiem_vu_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/bloc/nhiem_vu_cubit.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/ui/mobile/bloc/danh_sach_cubit.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/ui/tablet/danh_sach_tablet/widget/cell_danh_sach_nhiem_vu.dart';
import 'package:ccvc_mobile/presentation/choose_time/bloc/choose_time_cubit.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:ccvc_mobile/widgets/listview/listview_loadmore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DanhSachNhiemVuTablet extends StatefulWidget {
  final DanhSachCubit cubit;
  final bool isCheck;

  const DanhSachNhiemVuTablet({
    Key? key,
    required this.cubit,
    required this.isCheck,
  }) : super(key: key);

  @override
  _DanhSachNhiemVuTabletState createState() => _DanhSachNhiemVuTabletState();
}

class _DanhSachNhiemVuTabletState extends State<DanhSachNhiemVuTablet> {
  NhiemVuCubit cubit = NhiemVuCubit();
  ChooseTimeCubit chooseTimeCubit = ChooseTimeCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTabletColor,
      appBar: AppBarDefaultBack(S.current.danh_sach_nhiem_vu),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 28,
                top: 28,
              ),
              child: _content(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _content() {
    return ListViewLoadMore(
      cubit: widget.cubit,
      isListView: true,
      callApi: (page) => {
        widget.cubit.postDanhSachNhiemVu(
          index: page,
          isNhiemVuCaNhan: widget.isCheck,
          isSortByHanXuLy: true,
          mangTrangThai: [],
          ngayTaoNhiemVu: {
            'FromDate': widget.cubit.ngayDauTien,
            'ToDate': widget.cubit.ngayKetThuc
          },
          size: widget.cubit.pageSize,
        )
      },
      viewItem: (value, index) {
        try {
          return CellDanhSachNhiemVuTablet(
            data: value as PageData,
            index: index ?? 0,
          );
        } catch (e) {
          return const SizedBox();
        }
      },
    );
  }
}
