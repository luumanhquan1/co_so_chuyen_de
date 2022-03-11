import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/tien_ich_module/config/resources/color.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';

class DanhSachCongViecTienIchTablet extends StatefulWidget {
  const DanhSachCongViecTienIchTablet({Key? key}) : super(key: key);

  @override
  _DanhSachCongViecTienIchTabletState createState() =>
      _DanhSachCongViecTienIchTabletState();
}

class _DanhSachCongViecTienIchTabletState
    extends State<DanhSachCongViecTienIchTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTabletColor,
      appBar: AppBarDefaultBack(S.current.danh_sach_cong_viec),
      body: Container(),
    );
  }
}
