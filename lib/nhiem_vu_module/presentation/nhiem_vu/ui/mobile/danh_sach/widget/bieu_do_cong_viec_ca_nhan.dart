import 'package:ccvc_mobile/nhiem_vu_module/domain/model/dash_broash/dash_broash_nhiem_vu_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/ui/mobile/bloc/danh_sach_cubit.dart';
import 'package:ccvc_mobile/nhiem_vu_module/utils/extensions/string_extension.dart';
import 'package:ccvc_mobile/presentation/quan_li_van_ban/ui/widgets/box_satatus_vb.dart';
import 'package:ccvc_mobile/widgets/chart/base_pie_chart.dart';
import 'package:flutter/material.dart';

class BieuDoCongViecCaNhan extends StatefulWidget {
  final String? title;
  final DanhSachCubit cubit;
  final List<ChartData> chartData;

  const BieuDoCongViecCaNhan({
    Key? key,
    required this.cubit,
    required this.chartData,
    this.title,
  }) : super(key: key);

  @override
  _BieuDoCongViecCaNhanState createState() => _BieuDoCongViecCaNhanState();
}

class _BieuDoCongViecCaNhanState extends State<BieuDoCongViecCaNhan> {
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
          PieChart(
            title: widget.title ?? '',
            chartData: widget.chartData,
            onTap: (int value) {},
          ),
          Container(height: 20),
          StreamBuilder<List<LoaiNhiemVuComomModel>>(
            stream: widget.cubit.loaiCongViecCaNhanSuject,
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
