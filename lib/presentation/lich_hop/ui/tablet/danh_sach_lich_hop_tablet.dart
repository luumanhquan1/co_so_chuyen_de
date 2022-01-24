import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/lich_hop/bloc/lich_hop_cubit.dart';
import 'package:ccvc_mobile/presentation/lich_hop/widget/widget_item_lich_hop.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DanhSachLichHopTablet extends StatefulWidget {
  const DanhSachLichHopTablet({Key? key}) : super(key: key);

  @override
  _DanhSachLichHopTabletState createState() => _DanhSachLichHopTabletState();
}

class _DanhSachLichHopTabletState extends State<DanhSachLichHopTablet> {
  LichHopCubit cubit = LichHopCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultBack(S.current.danh_sach_lich_hop),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 28.0, right: 30.0, left: 30.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: cubit.listLichHop.length,
                itemBuilder: (context, index) {
                  return WidgetItemLichHop(
                    ontap: () {},
                    title: cubit.listLichHop[index].title,
                    dateTimeFrom:
                        DateTime.parse(cubit.listLichHop[index].dateTimeFrom)
                            .toStringWithAMPM,
                    dateTimeTo:
                        DateTime.parse(cubit.listLichHop[index].dateTimeTo)
                            .toStringWithAMPM,
                    urlImage: cubit.listLichHop[index].urlImage,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
