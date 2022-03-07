import 'package:ccvc_mobile/presentation/tao_lich_lam_viec_chi_tiet/ui/item_select_model.dart';
import 'package:ccvc_mobile/presentation/tao_lich_lam_viec_chi_tiet/ui/widget/title_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MauMacDinhWidget extends StatefulWidget {
  const MauMacDinhWidget({Key? key}) : super(key: key);

  @override
  _MauMacDinhWidgetState createState() => _MauMacDinhWidgetState();
}

class _MauMacDinhWidgetState extends State<MauMacDinhWidget> {
  @override
  Widget build(BuildContext context) {
    return TitleWidget(
      isColor: true,
      color: Colors.red,
      title: 'Màu mặc định',
      child: Column(
        children: listColorDefault
            .map((e) => Row(
                  children: [
                    Container(
                      height: 12,
                      width: 12,
                      color: e.color,
                    )
                  ],
                ),)
            .toList(),
      ),
    );
  }
}
