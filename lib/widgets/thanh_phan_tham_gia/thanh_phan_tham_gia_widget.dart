import 'package:ccvc_mobile/widgets/thanh_phan_tham_gia/them_don_vi_widget/them_don_vi_widget.dart';
import 'package:flutter/material.dart';
class ThanhPhanThamGiaWidget extends StatefulWidget {
  const ThanhPhanThamGiaWidget({Key? key}) : super(key: key);

  @override
  _ThanhPhanThamGiaWidgetState createState() => _ThanhPhanThamGiaWidgetState();
}

class _ThanhPhanThamGiaWidgetState extends State<ThanhPhanThamGiaWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ThemDonViWidget(
          onChange: (value){},
        )
      ],
    );
  }
}
