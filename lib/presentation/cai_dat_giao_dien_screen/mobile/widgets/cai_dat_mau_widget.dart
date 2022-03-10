import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/cai_dat_giao_dien_screen/widgets/title_cai_dat_widget.dart';
import 'package:flutter/material.dart';

class CaiDatMauWidget extends StatelessWidget {
  const CaiDatMauWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColorApp,
      child: TitleCaiDatWidget(
        title: S.current.cai_dat_mau,
        child: Row(
          children: [
            selectColorCell(color: labelColor, name: 'Mặc định'),
            selectColorCell(color: labelColor, name: 'Mặc định'),
            selectColorCell(color: labelColor, name: 'Mặc định'),
            selectColorCell(color: labelColor, name: 'Mặc định'),
          ],
        ),
      ),
    );
  }

  Widget selectColorCell({required Color color, required String name}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(8))),
        )
      ],
    );
  }
}
