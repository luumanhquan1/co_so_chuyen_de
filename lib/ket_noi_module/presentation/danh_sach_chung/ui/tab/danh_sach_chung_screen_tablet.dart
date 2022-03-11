import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/ket_noi_module/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/ket_noi_module/widgets/app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DanhSachChungScreenTablet extends StatefulWidget {
  const DanhSachChungScreenTablet({Key? key}) : super(key: key);

  @override
  _DanhSachChungScreenTabletState createState() =>
      _DanhSachChungScreenTabletState();
}

class _DanhSachChungScreenTabletState extends State<DanhSachChungScreenTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: BaseAppBar(
        title: S.current.chung,
        leadingIcon: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: SvgPicture.asset(
            ImageAssets.icBacks,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              ImageAssets.ic_mennu_ykien,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.black12,
        height: 50,
      ),
    );
  }
}
