import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/danh_sach_lich_hop.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/lich_hop.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_lich_hop/ui/phone/chi_tiet_lich_hop_screen.dart';
import 'package:ccvc_mobile/presentation/lich_hop/bloc/lich_hop_cubit.dart';
import 'package:ccvc_mobile/presentation/lich_hop/ui/widget/widget_item_lich_hop.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DanhSachLichHop extends StatefulWidget {
  final LichHopCubit cubit;

  const DanhSachLichHop({Key? key, required this.cubit}) : super(key: key);

  @override
  _DanhSachLichHopState createState() => _DanhSachLichHopState();
}

class _DanhSachLichHopState extends State<DanhSachLichHop> {
  LichHopCubit cubit = LichHopCubit();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            cubit.currentTime,
            style: textNormalCustom(color: textBodyTime),
          ),
        ),
        Expanded(
          child: StreamBuilder<DanhSachLichHopModel>(
              stream: widget.cubit.danhSachLichHopStream,
              builder: (context, snapshot) {
                final data = snapshot.data ?? DanhSachLichHopModel.empty();

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.items?.length ?? 0,
                    itemBuilder: (context, index) {
                      return WidgetItemLichHop(
                        ontap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailMeetCalenderScreen(),
                            ),
                          );
                        },
                        title: data.items?[index].title ?? '',
                        dateTimeFrom: DateTime.parse(
                          data.items?[index].dateTimeFrom ?? '',
                        ).toStringWithAMPM,
                        dateTimeTo: DateTime.parse(
                          data.items?[index].dateTimeTo ?? '',
                        ).toStringWithAMPM,
                        urlImage: listLichHop[index].urlImage,
                      );
                    },
                  ),
                );
              }),
        ),
      ],
    );
  }
}
