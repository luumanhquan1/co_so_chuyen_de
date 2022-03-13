import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';

class PhienDichTuDongMobile extends StatefulWidget {
  const PhienDichTuDongMobile({Key? key}) : super(key: key);

  @override
  _PhienDichTuDongMobileState createState() => _PhienDichTuDongMobileState();
}

class _PhienDichTuDongMobileState extends State<PhienDichTuDongMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultBack(
          S.current.phien_dich_tu_dong
      ),
      body: Container(),
    );
  }
}
