import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';

class ChuyenGiongNoiThanhVanBan extends StatefulWidget {
  const ChuyenGiongNoiThanhVanBan({Key? key}) : super(key: key);

  @override
  _ChuyenGiongNoiThanhVanBanState createState() => _ChuyenGiongNoiThanhVanBanState();
}

class _ChuyenGiongNoiThanhVanBanState extends State<ChuyenGiongNoiThanhVanBan> {
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
