import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';

class TraCuuVanBanPhapLuatMobile extends StatefulWidget {
  const TraCuuVanBanPhapLuatMobile({Key? key}) : super(key: key);

  @override
  _TraCuuVanBanPhapLuatMobileState createState() => _TraCuuVanBanPhapLuatMobileState();
}

class _TraCuuVanBanPhapLuatMobileState extends State<TraCuuVanBanPhapLuatMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultBack(
          S.current.tra_cuu_van_ban_phap_luat
      ),
      body: Container(),
    );
  }
}
