import 'package:ccvc_mobile/presentation/lich_lv_bao_cao_ket_qua/ui/mobile/widgets/btn_show_bao_cao.dart';
import 'package:flutter/material.dart';

import 'lich_lv_bao_cao_ket_qua/ui/tablet/widgets/btn_show_bao_cao_tablet.dart';
import 'lichlv_danh_sach_y_kien/ui/mobile/show_bottom_sheet_ds_y_Kien.dart';
class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BtnShowBaoCaoTablet(),
    );
  }
}
