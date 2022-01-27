import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/lichlv_danh_sach_y_kien/ui/mobile/danh_sach_y_kien_screen.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/show_buttom_sheet/show_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class DanhSachYKienButtom extends StatefulWidget {
  const DanhSachYKienButtom({Key? key}) : super(key: key);

  @override
  _DanhSachYKienButtomState createState() => _DanhSachYKienButtomState();
}

class _DanhSachYKienButtomState extends State<DanhSachYKienButtom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 6, 0, 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: labelColor.withOpacity(0.1),
      ),
      width: 164,
      child: GestureDetector(
        child: Row(
          children:[
           SvgPicture.asset(ImageAssets.ic_danhsachykien),
            const SizedBox(width: 6,),
            Text(S.current.danh_sach_y_kien,style: textNormalCustom(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: labelColor,
            ),)
          ],
        ),
        onTap: (){
          showBottomSheetCustom(
            context,
            child: const DanhSachYKienScreen(),
            title: S.current.danh_sach_y_kien,
          );
        },
      ),
    );
  }
}
