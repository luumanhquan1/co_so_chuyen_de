import 'package:ccvc_mobile/presentation/lichlv_danh_sach_y_kien/ui/tablet/show_bottom_sheet_ds_y_Kien_tablet.dart';
import 'package:flutter/material.dart';

import 'lichlv_danh_sach_y_kien/ui/mobile/show_bottom_sheet_ds_y_Kien.dart';
class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DanhSachYKienButtomTablet(),
    );
  }
}
