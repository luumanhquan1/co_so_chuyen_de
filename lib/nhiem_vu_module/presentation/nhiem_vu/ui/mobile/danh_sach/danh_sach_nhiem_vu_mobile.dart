import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/danh_sach_nhiem_vu_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/ui/mobile/bloc/danh_sach_cubit.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/widget/nhiem_vu_item_mobile.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:ccvc_mobile/widgets/listview/listview_loadmore.dart';
import 'package:ccvc_mobile/widgets/search/base_search_bar.dart';
import 'package:flutter/material.dart';

class DanhSachNhiemVuMobile extends StatefulWidget {
  final DanhSachCubit cubit;
  final bool isCheck;

  const DanhSachNhiemVuMobile({
    Key? key,
    required this.cubit,
    required this.isCheck,
  }) : super(key: key);

  @override
  _DanhSachNhiemVuMobileState createState() => _DanhSachNhiemVuMobileState();
}

class _DanhSachNhiemVuMobileState extends State<DanhSachNhiemVuMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultBack(S.current.danh_sach_nhiem_vu),
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
          return NhiemVuItemMobile(
            data: value as PageData,
          );
        } catch (e) {
          return const SizedBox();
        }
      },
    );
  }
}
