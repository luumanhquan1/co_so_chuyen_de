import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/tien_ich_module/config/resources/color.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';

class ChuyenGiongNoiThanhVanBanTablet extends StatefulWidget {
  const ChuyenGiongNoiThanhVanBanTablet({Key? key}) : super(key: key);

  @override
  _ChuyenGiongNoiThanhVanBanTabletState createState() => _ChuyenGiongNoiThanhVanBanTabletState();
}

class _ChuyenGiongNoiThanhVanBanTabletState extends State<ChuyenGiongNoiThanhVanBanTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTabletColor,
      appBar: AppBarDefaultBack(
        S.current.chuyen_giong_noi_thanh_van_ban
      ),
      body: Container(),
    );
  }
}
