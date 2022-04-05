import 'package:ccvc_mobile/home_module/widgets/chart/base_pie_chart.dart';
import 'package:ccvc_mobile/presentation/lich_hop/bloc/lich_hop_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CoCauLichHopWidget extends StatelessWidget {
  final LichHopCubit cubit;

  const CoCauLichHopWidget({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: StreamBuilder<List<ChartData>>(
        stream: cubit.coCauLichHopSubject.stream,
        builder: (context, snapshot) {
          final data = snapshot.data ?? [];
          return PieChart(
            chartData: data,
            isThongKeLichHop: false,
          );
        },
      ),
    );
  }
}
