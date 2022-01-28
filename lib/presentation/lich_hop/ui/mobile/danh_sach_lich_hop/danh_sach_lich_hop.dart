import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/lich_hop.dart';
import 'package:ccvc_mobile/presentation/lich_hop/bloc/lich_hop_cubit.dart';
import 'package:ccvc_mobile/presentation/lich_hop/ui/widget/widget_item_lich_hop.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DanhSachLichHop extends StatefulWidget {
  const DanhSachLichHop({Key? key}) : super(key: key);

  @override
  _DanhSachLichHopState createState() => _DanhSachLichHopState();
}

class _DanhSachLichHopState extends State<DanhSachLichHop> {
  LichHopCubit cubit = LichHopCubit();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 120,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              cubit.currentTime,
              style: textNormalCustom(color: textBodyTime),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: listLichHop.length,
              itemBuilder: (context, index) {
                return WidgetItemLichHop(
                  ontap: () {},
                  title: listLichHop[index].title,
                  dateTimeFrom: DateTime.parse(
                    listLichHop[index].dateTimeFrom,
                  ).toStringWithAMPM,
                  dateTimeTo: DateTime.parse(listLichHop[index].dateTimeTo)
                      .toStringWithAMPM,
                  urlImage: listLichHop[index].urlImage,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}