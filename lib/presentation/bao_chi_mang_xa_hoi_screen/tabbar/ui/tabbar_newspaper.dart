import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tabbar/bloc/bao_chi_mang_xa_hoi_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabbarNewspaper extends StatefulWidget {
  const TabbarNewspaper({Key? key}) : super(key: key);

  @override
  State<TabbarNewspaper> createState() => _TabbarNewspaperState();
}

class _TabbarNewspaperState extends State<TabbarNewspaper> {
  var _controller = TabController(vsync: AnimatedListState(), length: 4);
  BaoChiMangXaHoiBloc baoChiMangXaHoiBloc = BaoChiMangXaHoiBloc();

  @override
  void initState() {
    _controller = TabController(vsync: AnimatedListState(), length: 4);

    _controller.addListener(() {
      setState(() {
        baoChiMangXaHoiBloc.getTextAppbar(_controller.index);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          baoChiMangXaHoiBloc.titleAppbar,
          style: titleAppbar(),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
            color: unselectLabelColor,),
          onPressed: () {},
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.menu_open_rounded,
              color: unselectLabelColor,),

            onPressed: () {},
          ),
        ],

        bottom: TabBar(
          controller: _controller,
          indicatorColor: indicatorColor,
          unselectedLabelColor: unselectLabelColor,
          labelColor: labelColor,
          tabs: [
            Tab(
              child: Text(
                S.current.bao_cao_thong_ke,
                maxLines: 1,
              ),
            ),
            Tab(
              child: Text(S.current.tat_ca_chu_de, maxLines: 1),
            ),
            Tab(
              child: Text(S.current.theo_doi_bai_viet, maxLines: 1),
            ),
            Tab(
              child: Text(S.current.tin_tuc_thoi_su, maxLines: 1),
            ),
          ],
        ),
      ),
      body: TabBarView(controller: _controller, children: [
        Text(
          S.current.bao_cao_thong_ke,
        ),
        Text(S.current.tat_ca_chu_de),
        Text(S.current.theo_doi_bai_viet),
        Text(S.current.tin_tuc_thoi_su),
      ]),

    );
  }
}
