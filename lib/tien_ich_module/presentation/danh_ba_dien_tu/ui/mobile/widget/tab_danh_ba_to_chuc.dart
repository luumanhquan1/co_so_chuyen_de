import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/tien_ich_module/config/resources/color.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/bloc_danh_ba_dien_tu/bloc_danh_ba_dien_tu_cubit.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/ui/mobile/tree/tree_view/view_tong.dart';
import 'package:ccvc_mobile/tien_ich_module/utils/extensions/screen_device_extension.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/search/base_search_bar.dart';
import 'package:flutter/material.dart';

class DanhBaToChuc extends StatefulWidget {
  const DanhBaToChuc({Key? key}) : super(key: key);

  @override
  _DanhBaToChucState createState() => _DanhBaToChucState();
}

class _DanhBaToChucState extends State<DanhBaToChuc> {
  DanhBaDienTuCubit cubit = DanhBaDienTuCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // cubit.callApiDanhSach();
  }

  @override
  Widget build(BuildContext context) {
    return screenDevice(
      mobileScreen: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: BaseSearchBar(
                    hintText: S.current.tim_kiem_danh_ba,
                    onChange: (value) {},
                  ),
                ),
              ),
              ViewTongWidget(
                onChange: () {},
              )
            ],
          ),
        ),
      ),
      tabletScreen: Scaffold(
        backgroundColor: bgManagerColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: BaseSearchBar(
                    hintText: S.current.tim_kiem_danh_ba,
                    onChange: (value) {},
                  ),
                ),
              ),
              ViewTongWidget(
                onChange: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
