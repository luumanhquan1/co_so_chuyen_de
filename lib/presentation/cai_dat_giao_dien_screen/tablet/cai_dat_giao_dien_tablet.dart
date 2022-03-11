import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/cai_dat_giao_dien_screen/tablet/widgets/cai_dat_mau_tablet.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';
class CaiDatGiaoDienTablet extends StatefulWidget {
  const CaiDatGiaoDienTablet({Key? key}) : super(key: key);

  @override
  _CaiDatGiaoDienTabletState createState() => _CaiDatGiaoDienTabletState();
}

class _CaiDatGiaoDienTabletState extends State<CaiDatGiaoDienTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeColor,
      appBar: AppBarDefaultBack(S.current.cai_dat_giao_dien),
      body: Column(
        children: [
          CaiDatMauTabletWidget()
        ],
      ),
    );
  }
}
