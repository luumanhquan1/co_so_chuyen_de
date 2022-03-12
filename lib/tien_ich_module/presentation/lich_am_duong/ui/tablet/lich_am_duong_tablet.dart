import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/tien_ich_module/config/resources/color.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';

class LichAmDuongTablet extends StatefulWidget {
  const LichAmDuongTablet({Key? key}) : super(key: key);

  @override
  _LichAmDuongTabletState createState() => _LichAmDuongTabletState();
}

class _LichAmDuongTabletState extends State<LichAmDuongTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTabletColor,
      appBar: AppBarDefaultBack(S.current.lich_am_duong),
      body: Container(),
    );
  }
}
