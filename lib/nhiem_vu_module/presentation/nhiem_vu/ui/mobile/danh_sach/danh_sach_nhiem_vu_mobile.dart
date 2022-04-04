import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/danh_sach_nhiem_vu_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/ui/mobile/bloc/danh_sach_cubit.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/widget/nhiem_vu_item_mobile.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:ccvc_mobile/widgets/listview/listview_loadmore.dart';
import 'package:ccvc_mobile/widgets/search/base_search_bar.dart';
import 'package:flutter/material.dart';

class DanhSachNhiemVuMobile extends StatefulWidget {
  const DanhSachNhiemVuMobile({Key? key}) : super(key: key);

  @override
  _DanhSachNhiemVuMobileState createState() => _DanhSachNhiemVuMobileState();
}

class _DanhSachNhiemVuMobileState extends State<DanhSachNhiemVuMobile> {
  DanhSachCubit cubit = DanhSachCubit();

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
                cubit.keySearch = value;
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
      cubit: cubit,
      isListView: true,
      callApi: (page) => {
        cubit.postDanhSachNhiemVu(
          index: page,
          isNhiemVuCaNhan: true,
          isSortByHanXuLy: true,
          mangTrangThai: [],
          ngayTaoNhiemVu: {'FromDate': '2021/04/01', 'ToDate': "2022/05/01"},
          size: cubit.pageSize,
        )
      },
      viewItem: (value, index) => NhiemVuItemMobile(
        data: value as PageData,
      ),
    );
  }
}
