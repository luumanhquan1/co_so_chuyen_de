import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/danh_sach_cong_viec_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/chi_tiet_cong_viec_nhiem_vu/ui/tablet/chi_tiet_cong_viec_nhiem_vu_tablet.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/bloc/nhiem_vu_cubit.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/ui/mobile/bloc/danh_sach_cubit.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/ui/tablet/danh_sach_tablet/widget/cell_danh_sach_cong_viec_tablet.dart';
import 'package:ccvc_mobile/presentation/choose_time/bloc/choose_time_cubit.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:ccvc_mobile/widgets/listview/listview_loadmore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DanhSachCongViecTablet extends StatefulWidget {
  final DanhSachCubit cubit;
  final bool isCheck;

  const DanhSachCongViecTablet({
    Key? key,
    required this.cubit,
    required this.isCheck,
  }) : super(key: key);

  @override
  _DanhSachCongViecTabletState createState() => _DanhSachCongViecTabletState();
}

class _DanhSachCongViecTabletState extends State<DanhSachCongViecTablet> {
  NhiemVuCubit cubit = NhiemVuCubit();
  ChooseTimeCubit chooseTimeCubit = ChooseTimeCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTabletColor,
      appBar: AppBarDefaultBack(S.current.danh_sach_cong_viec),
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
        widget.cubit.postDanhSachCongViec(
          hanXuLy: {
            'FromDate': widget.cubit.ngayDauTien,
            'ToDate': widget.cubit.ngayKetThuc
          },
          index: page,
          isCaNhan: widget.isCheck,
          isSortByHanXuLy: true,
          keySearch: widget.cubit.keySearch,
          mangTrangThai: [],
          size: widget.cubit.pageSize,
          trangThaiHanXuLy: '',
        )
      },
      viewItem: (value, index) {
        try {
          return CellDanhSachCongViecTablet(
            data: value as PageDatas,
            index: index ?? 0,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChitietCongViecNhiemVuTablet(
                    id: value.id ?? '',
                  ),
                ),
              );
            },
          );
        } catch (e) {
          return const SizedBox();
        }
      },
    );
  }
}
