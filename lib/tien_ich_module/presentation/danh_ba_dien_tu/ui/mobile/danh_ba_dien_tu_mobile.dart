import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';

class DanhBaDienTuMobile extends StatefulWidget {
  const DanhBaDienTuMobile({Key? key}) : super(key: key);

  @override
  _DanhBaDienTuMobileState createState() => _DanhBaDienTuMobileState();
}

class _DanhBaDienTuMobileState extends State<DanhBaDienTuMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultBack(
          S.current.danh_ba_dien_tu
      ),
      body: Container(),
    );
  }
}
