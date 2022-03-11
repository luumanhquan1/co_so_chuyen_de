import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/tien_ich_module/config/resources/color.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';

class PhienDichTuDongTablet extends StatefulWidget {
  const PhienDichTuDongTablet({Key? key}) : super(key: key);

  @override
  _PhienDichTuDongTabletState createState() => _PhienDichTuDongTabletState();
}

class _PhienDichTuDongTabletState extends State<PhienDichTuDongTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTabletColor,
      appBar: AppBarDefaultBack(
        S.current.phien_dich_tu_dong,
      ),
      body: Container(),
    );
  }
}
