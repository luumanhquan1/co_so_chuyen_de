import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/tien_ich_module/config/resources/color.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';

class ChuyenVanBanThanhGiongNoiTablet extends StatefulWidget {
  const ChuyenVanBanThanhGiongNoiTablet({Key? key}) : super(key: key);

  @override
  _ChuyenVanBanThanhGiongNoiTabletState createState() => _ChuyenVanBanThanhGiongNoiTabletState();
}

class _ChuyenVanBanThanhGiongNoiTabletState extends State<ChuyenVanBanThanhGiongNoiTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTabletColor,
      appBar: AppBarDefaultBack(
          S.current.chuyen_van_ban_thanh_giong_noi
      ),
      body: Container(),
    );
  }
}
