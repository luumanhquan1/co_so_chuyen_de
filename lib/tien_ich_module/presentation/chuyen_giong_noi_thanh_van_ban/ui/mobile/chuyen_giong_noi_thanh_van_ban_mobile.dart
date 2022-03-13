import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';

class ChuyenGiongNoiThanhVanBanMobile extends StatefulWidget {
  const ChuyenGiongNoiThanhVanBanMobile({Key? key}) : super(key: key);

  @override
  _ChuyenGiongNoiThanhVanBanMobileState createState() => _ChuyenGiongNoiThanhVanBanMobileState();
}

class _ChuyenGiongNoiThanhVanBanMobileState extends State<ChuyenGiongNoiThanhVanBanMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultBack(
        S.current.chuyen_giong_noi_thanh_van_ban
      ),
      body: Container(),
    );
  }
}
