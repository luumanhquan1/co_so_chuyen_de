import 'package:ccvc_mobile/domain/model/y_kien_model.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_lich_hop/bloc/chi_tiet_lich_hop_cubit.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_lich_lam_viec/ui/lichlv_danh_sach_y_kien/ui/mobile/widgets/item_y_kiem.dart';
import 'package:ccvc_mobile/widgets/text/no_data_widget.dart';
import 'package:flutter/material.dart';

class DanhSachYKienLichHopWidget extends StatefulWidget {
  final DetailMeetCalenderCubit cubit;
  const DanhSachYKienLichHopWidget({Key? key,required this.cubit}) : super(key: key);

  @override
  _DanhSachYKienLichHopWidgetState createState() => _DanhSachYKienLichHopWidgetState();
}

class _DanhSachYKienLichHopWidgetState extends State<DanhSachYKienLichHopWidget> {



  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      margin: const EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: StreamBuilder<List<YKienModel>>(
            stream: widget.cubit.listYKien,
            builder: (context, snapshot) {
              final listData = snapshot.data ?? [];
              if (listData.isNotEmpty) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listData.length,
                  itemBuilder: (context, index) {
                    return ItemYKien(
                      yKienModel: listData[index],
                    );
                  },
                );
              } else {
                return const NodataWidget();
              }
            },
          ),
        ),
      ),
    );
  }
}
