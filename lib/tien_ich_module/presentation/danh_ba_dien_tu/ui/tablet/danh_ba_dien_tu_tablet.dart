import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/tien_ich_module/config/resources/color.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';

class DanhBaDienTuTablet extends StatefulWidget {
  const DanhBaDienTuTablet({Key? key}) : super(key: key);

  @override
  _DanhBaDienTuTabletState createState() => _DanhBaDienTuTabletState();
}

class _DanhBaDienTuTabletState extends State<DanhBaDienTuTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTabletColor,
      appBar: AppBarDefaultBack(
          S.current.danh_ba_dien_tu
      ),
      body: Container(),
    );
  }
}
