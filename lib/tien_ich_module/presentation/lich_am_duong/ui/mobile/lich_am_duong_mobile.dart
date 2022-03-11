import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';

class LichAmDuongMobile extends StatefulWidget {
  const LichAmDuongMobile({Key? key}) : super(key: key);

  @override
  _LichAmDuongMobileState createState() => _LichAmDuongMobileState();
}

class _LichAmDuongMobileState extends State<LichAmDuongMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultBack(S.current.lich_am_duong),
      body: Container(),
    );
  }
}
