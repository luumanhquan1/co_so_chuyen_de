import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/danh_sach_cong_viec_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/chi_tiet_cong_viec_nhiem_vu/ui/mobile/chi_tiet_cong_viec_nhiem_vu.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/ui/mobile/bloc/danh_sach_cubit.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/ui/mobile/danh_sach/widget/cell_cong_viec.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:ccvc_mobile/widgets/listview/listview_loadmore.dart';
import 'package:ccvc_mobile/widgets/search/base_search_bar.dart';
import 'package:flutter/material.dart';

class DanhSachCongViecMobile extends StatefulWidget {
  final DanhSachCubit cubit;

  const DanhSachCongViecMobile({Key? key, required this.cubit})
      : super(key: key);

  @override
  _DanhSachCongViecMobileState createState() => _DanhSachCongViecMobileState();
}

class _DanhSachCongViecMobileState extends State<DanhSachCongViecMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultBack(S.current.danh_sach_cong_viec),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 16.0,
            ),
            BaseSearchBar(
              onChange: (value) {
                setState(() {});
                widget.cubit.keySearch = value;
              },
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 16),
                child: _content(),
              ),
            ),
          ],
        ),
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
          isCaNhan: false,
          isSortByHanXuLy: true,
          keySearch: widget.cubit.keySearch,
          mangTrangThai: [],
          size: widget.cubit.pageSize,
          trangThaiHanXuLy: '',
        )
      },
      viewItem: (value, index) => CellCongViec(
        data: value as PageDatas,
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChitietCongViecNhiemVuMobile(
                id: value.id??'',
              ),
            ),
          );
        },
      ),
    );
  }
}
