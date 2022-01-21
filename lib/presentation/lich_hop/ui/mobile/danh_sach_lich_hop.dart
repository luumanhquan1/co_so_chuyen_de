import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/lich_hop/widget/widget_item_lich_hop.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/appbar/base_app_bar.dart';
import 'package:ccvc_mobile/widgets/calendar/table_calendar/table_calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DanhSachLichHop extends StatefulWidget {
  const DanhSachLichHop({Key? key}) : super(key: key);

  @override
  _DanhSachLichHopState createState() => _DanhSachLichHopState();
}

class _DanhSachLichHopState extends State<DanhSachLichHop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: S.current.danh_sach_lich_hop,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(ImageAssets.icMenuCalender),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendarWidget(),
            WidgetItemLichHop(
              ontap: (){

              },
              title: "sds",
              dateTimeFrom: "2021-12-29T07:45:00",
              dateTimeTo: '2021-12-29T07:45:00',
              urlImage: "",
            )
          ],
        ),
      ),
    );
  }
}
