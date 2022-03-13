import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/tien_ich_module/config/resources/color.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';

class TraCuuVanBanPhapLuatTablet extends StatefulWidget {
  const TraCuuVanBanPhapLuatTablet({Key? key}) : super(key: key);

  @override
  _TraCuuVanBanPhapLuatTabletState createState() => _TraCuuVanBanPhapLuatTabletState();
}

class _TraCuuVanBanPhapLuatTabletState extends State<TraCuuVanBanPhapLuatTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTabletColor,
      appBar: AppBarDefaultBack(
          S.current.tra_cuu_van_ban_phap_luat
      ),
      body: Container(),
    );
  }
}
