import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/tao_lich_lam_viec_chi_tiet/ui/widget/loai_lich_widget.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/appbar/base_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TaoLichLamViecChiTietScreen extends StatefulWidget {
  const TaoLichLamViecChiTietScreen({Key? key}) : super(key: key);

  @override
  _TaoLichLamViecChiTietScreenState createState() =>
      _TaoLichLamViecChiTietScreenState();
}

class _TaoLichLamViecChiTietScreenState
    extends State<TaoLichLamViecChiTietScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: S.current.tao_lich_cong_tac_trong_nuoc,
        leadingIcon: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: unselectLabelColor,
            size: 18,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(ImageAssets.icEdit),
                  const SizedBox(width: 14,),
                  Expanded(
                    child: Form(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintStyle: textNormalCustom(
                            color: unselectLabelColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                          hintText: S.current.tieu_de,

                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: lineColor),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: lineColor),
                          ),

                        ),
                      ),
                    ),
                  )
                ],
              ),

              LoaiLichWidget()
            ],
          ),
        ),
      ),
    );
  }
}
//
// class WidgetInherited extends InheritedWidget {
//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) {
//     return true;
//   }
//
//   static WidgetInherited of(BuildContext context) {
//     final WidgetInherited? result =
//     context.dependOnInheritedWidgetOfExactType<WidgetInherited>();
//     assert(result != null, 'No elenment');
//     return result!;
//   }
//
// }
