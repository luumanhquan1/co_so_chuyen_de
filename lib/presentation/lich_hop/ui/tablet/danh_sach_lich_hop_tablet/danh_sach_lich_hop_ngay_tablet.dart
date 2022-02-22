import 'package:ccvc_mobile/domain/model/lich_hop/danh_sach_lich_hop.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/lich_hop.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_lich_hop/ui/tablet/chi_tiet_lich_hop_screen_tablet.dart';
import 'package:ccvc_mobile/presentation/lich_hop/bloc/lich_hop_cubit.dart';
import 'package:ccvc_mobile/presentation/lich_hop/ui/widget/widget_item_lich_hop.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DanhSachLichHopNgayTablet extends StatefulWidget {
  final LichHopCubit cubit;

  const DanhSachLichHopNgayTablet({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  _DanhSachLichHopNgayTabletState createState() =>
      _DanhSachLichHopNgayTabletState();
}

class _DanhSachLichHopNgayTabletState extends State<DanhSachLichHopNgayTablet> {
  LichHopCubit cubit = LichHopCubit();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0, left: 30.0),
            child: StreamBuilder<DanhSachLichHopModel>(
                stream: cubit.danhSachLichHopStream,
                builder: (context, snapshot) {
                  final data = snapshot.data ?? DanhSachLichHopModel.empty();

                  return Padding(
                    padding: const EdgeInsets.only(right: 30.0, left: 30.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.items?.length ?? 0,
                      itemBuilder: (context, index) {
                        return WidgetItemLichHop(
                          ontap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailMeetCalenderTablet(),
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
      ),
    );
  }
}
