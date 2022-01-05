import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatelessWidget {
  final List<ChartData> chartData;
  final String title;
  final double paddingTop;

  const PieChart({
    Key? key,
    required this.chartData,
    this.title = '',
    this.paddingTop = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title.isEmpty)
          const SizedBox()
        else
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: paddingTop),
              child: Text(
                title,
                style: textNormalCustom(
                  color: const Color(0xff667793),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        SizedBox(
          width: 270,
          height: 270,
          child: SfCircularChart(
            margin: EdgeInsets.zero,
            series: [
              // Renders doughnut chart
              DoughnutSeries<ChartData, String>(
                innerRadius: '45',
                dataSource: chartData,
                pointColorMapper: (ChartData data, _) => data.color,
                xValueMapper: (ChartData data, _) => data.title,
                yValueMapper: (ChartData data, _) => data.value,
                dataLabelMapper: (ChartData data, _) => percent(data.value),
                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  showZeroValue: false,
                  textStyle: textNormalCustom(
                    color: const Color(0xffFFFFFF),
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 10,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: List.generate(chartData.length, (index) {
            final result = chartData[index];
            // ignore: avoid_unnecessary_containers
            return Container(
              child: Row(
                children: [
                  Container(
                    height: 14,
                    width: 14,
                    decoration: BoxDecoration(
                      color: result.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    '${result.title} (${result.value.toInt()})',
                    style: textNormal(
                      const Color(0xff667793),
                      14,
                    ),
                  )
                ],
              ),
            );
          }),
        )
      ],
    );
  }

  String percent(double vl) {
    double sum = 0;
    for (final vl in chartData) {
      sum += vl.value;
    }
    final double percent = (vl / sum) * 100;
    return '${percent.toStringAsFixed(2)}%';
  }
}

class ChartData {
  ChartData(this.title, this.value, this.color);

  final String title;
  final double value;
  final Color color;
}
