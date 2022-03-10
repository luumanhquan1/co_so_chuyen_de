import 'package:ccvc_mobile/home_module/utils/extensions/screen_device_extension.dart';
import 'package:ccvc_mobile/presentation/cai_dat_giao_dien_screen/mobile/cai_dat_giao_dien_mobile.dart';
import 'package:flutter/material.dart';

class CaiDatGiaoDienScreen extends StatefulWidget {
  const CaiDatGiaoDienScreen({Key? key}) : super(key: key);

  @override
  _CaiDatGiaoDienScreenState createState() => _CaiDatGiaoDienScreenState();
}

class _CaiDatGiaoDienScreenState extends State<CaiDatGiaoDienScreen> {
  @override
  Widget build(BuildContext context) {
    return screenDevice(
        mobileScreen: const CaiDatGiaoDienMobileScreen(),
        tabletScreen: Scaffold());
  }
}
