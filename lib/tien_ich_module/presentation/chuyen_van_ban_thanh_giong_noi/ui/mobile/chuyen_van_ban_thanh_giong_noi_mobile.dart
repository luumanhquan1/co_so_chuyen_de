import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';

class ChuyenVanBanThanhGiongNoi extends StatefulWidget {
  const ChuyenVanBanThanhGiongNoi({Key? key}) : super(key: key);

  @override
  _ChuyenVanBanThanhGiongNoiState createState() => _ChuyenVanBanThanhGiongNoiState();
}

class _ChuyenVanBanThanhGiongNoiState extends State<ChuyenVanBanThanhGiongNoi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultBack(
          S.current.chuyen_van_ban_thanh_giong_noi
      ),
      body: Container(),
    );
  }
}
