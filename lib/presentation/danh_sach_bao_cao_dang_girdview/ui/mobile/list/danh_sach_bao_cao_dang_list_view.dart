import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/appbar/mobile/base_app_bar_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DanhSachBaoCaoDangListView extends StatefulWidget {
  const DanhSachBaoCaoDangListView({Key? key}) : super(key: key);

  @override
  _DanhSachBaoCaoDangListViewState createState() =>
      _DanhSachBaoCaoDangListViewState();
}

class _DanhSachBaoCaoDangListViewState
    extends State<DanhSachBaoCaoDangListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBarMobile(
        title: S.current.bac_cao,
        actions: [
          Container(
            color: Colors.yellow,
            child: SvgPicture.asset(ImageAssets.icGridView),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.red,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
