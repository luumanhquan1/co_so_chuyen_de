import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/presentation/cai_dat_giao_dien_screen/mobile/widgets/cai_dat_mau_widget.dart';
import 'package:flutter/material.dart';

class CaiDatGiaoDienMobileScreen extends StatefulWidget {
  const CaiDatGiaoDienMobileScreen({Key? key}) : super(key: key);

  @override
  _CaiDatGiaoDienMobileScreenState createState() =>
      _CaiDatGiaoDienMobileScreenState();
}

class _CaiDatGiaoDienMobileScreenState
    extends State<CaiDatGiaoDienMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeColor,
      body: SingleChildScrollView(
        child: Column(
          children: [CaiDatMauWidget()],
        ),
      ),
    );
  }
}
