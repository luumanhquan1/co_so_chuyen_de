import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/thong_ke_lich_hop/statistic_by_month_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/lich_hop/bloc/lich_hop_cubit.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ThongKeLichHopScreen extends StatefulWidget {
  final LichHopCubit cubit;

  const ThongKeLichHopScreen({Key? key, required this.cubit}) : super(key: key);

  @override
  _ThongKeLichHopScreenState createState() => _ThongKeLichHopScreenState();
}

class _ThongKeLichHopScreenState extends State<ThongKeLichHopScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.current.so_lich_hop_theo_thoi_gian_trong_nam,
            style: textNormalCustom(
              color: textTitle,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          StreamBuilder<List<StatisticByMonthModel>>(
              stream: widget.cubit.statisticSubject.stream,
              builder: (context, snapshot) {
                final dataByMonth = snapshot.data ?? [];
                return SfCartesianChart(
                  margin: const EdgeInsets.only(top: 20),
                  primaryXAxis: CategoryAxis(
                    title: AxisTitle(
                      alignment: ChartAlignment.near,
                      text: S.current.thang,
                      textStyle: textNormalCustom(
                        color: AqiColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    placeLabelsNearAxisLine: true,
                    labelStyle: textNormalCustom(
                      color: AqiColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    axisLine: const AxisLine(
                      color: AqiColor,
                      width: 0.41,
                    ),
                    majorGridLines: const MajorGridLines(width: 0),
                  ),
                  primaryYAxis: CategoryAxis(
                    labelStyle: textNormalCustom(
                      color: AqiColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    placeLabelsNearAxisLine: true,
                    axisLine: const AxisLine(
                      color: AqiColor,
                      width: 0.41,
                    ),
                    interval: 10,
                    minimum: 0,
                    majorGridLines: const MajorGridLines(
                      width: 0.41,
                      dashArray: [5, 5],
                    ),
                  ),
                  series: <ChartSeries<StatisticByMonthModel, int>>[
                    StackedLineSeries<StatisticByMonthModel, int>(
                      dataSource: dataByMonth,
                      xValueMapper: (StatisticByMonthModel sales, _) =>
                          sales.month,
                      yValueMapper: (StatisticByMonthModel sales, _) =>
                          sales.quantities,
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: true),
                      markerSettings: const MarkerSettings(
                        isVisible: true,
                        color: choXuLyColor,
                      ),
                    )
                  ],
                );
              })
        ],
      ),
    );
  }
}
