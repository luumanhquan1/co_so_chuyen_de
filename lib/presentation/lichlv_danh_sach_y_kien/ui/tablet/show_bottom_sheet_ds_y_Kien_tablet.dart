import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/lichlv_danh_sach_y_kien/ui/tablet/danh_sach_y_kien_screen_tablet.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/button/solid_button.dart';
import 'package:flutter/material.dart';

class DanhSachYKienButtomTablet extends StatefulWidget {
  const DanhSachYKienButtomTablet({Key? key}) : super(key: key);

  @override
  _DanhSachYKienButtomTabletState createState() =>
      _DanhSachYKienButtomTabletState();
}

class _DanhSachYKienButtomTabletState extends State<DanhSachYKienButtomTablet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 6, 0, 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: labelColor.withOpacity(0.1),
      ),
      child: SolidButton(
        text: S.current.danh_sach_y_kien,
        urlIcon: ImageAssets.ic_danhsachykien,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DanhSachYKienTabletScreen(),
            ),
          );
        },
      ),
    );
  }
}