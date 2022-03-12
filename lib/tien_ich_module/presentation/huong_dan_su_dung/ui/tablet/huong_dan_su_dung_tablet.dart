import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/tien_ich_module/config/resources/color.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';

class HuongDanSuDungTablet extends StatefulWidget {
  const HuongDanSuDungTablet({Key? key}) : super(key: key);

  @override
  _HuongDanSuDungTabletState createState() => _HuongDanSuDungTabletState();
}

class _HuongDanSuDungTabletState extends State<HuongDanSuDungTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTabletColor,
      appBar: AppBarDefaultBack(
          S.current.huong_dan_su_dung
      ),
      body: Container(),
    );
  }
}
