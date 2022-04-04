import 'package:ccvc_mobile/nhiem_vu_module/domain/model/dash_broash/dash_broash_nhiem_vu_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/ui/mobile/bloc/danh_sach_cubit.dart';
import 'package:ccvc_mobile/nhiem_vu_module/utils/extensions/string_extension.dart';
import 'package:ccvc_mobile/presentation/quan_li_van_ban/ui/widgets/box_satatus_vb.dart';
import 'package:ccvc_mobile/widgets/chart/base_pie_chart.dart';
import 'package:flutter/material.dart';

class BieuDoNhiemVuMobile extends StatefulWidget {
  //final LoaiNhiemVuComomModel loaiNhiemVuComomModel;
  final String? title;
  final DanhSachCubit cubit;
  final List<ChartData> chartData;

  const BieuDoNhiemVuMobile({
    Key? key,
    required this.cubit,
    // required this.loaiNhiemVuComomModel,
    required this.chartData,
    this.title,
  }) : super(key: key);

  @override
  _BieuDoNhiemVuMobileState createState() => _BieuDoNhiemVuMobileState();
}

class _BieuDoNhiemVuMobileState extends State<BieuDoNhiemVuMobile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder<List<ChartData>>(
            stream: widget.cubit.statusSuject,
            initialData: widget.cubit.chartDataNhiemVu,
            builder: (context, snapshot) {
              final data = snapshot.data ?? [];
              return PieChart(
                title: widget.title ?? '',
                chartData: data,
                onTap: (int value) {},
              );
            },
          ),
          Container(height: 20),
          StreamBuilder<List<LoaiNhiemVuComomModel>>(
            stream: widget.cubit.loaiNhiemVuSuject,
            initialData: listFakeData,
            builder: (context, snapshot) {
              final data = snapshot.data ?? [];
              return Row(
                children: data
                    .map(
                      (e) => Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(right: 16),
                          child: BoxStatusVanBan(
                            value: e.value ?? 0,
                            onTap: () {},
                            color: (e.giaTri ?? '').status(),
                            statusName: e.text ?? '',
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          )
        ],
      ),
    );
  }
}
