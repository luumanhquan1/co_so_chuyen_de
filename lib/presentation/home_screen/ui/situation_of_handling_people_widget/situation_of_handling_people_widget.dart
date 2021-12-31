import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_backgroud_widget.dart';
import 'package:ccvc_mobile/widgets/chart/base_pie_chart.dart';
import 'package:flutter/material.dart';

class SituationOfHandlingPeopleWidget extends StatelessWidget {
  const SituationOfHandlingPeopleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ContainerBackgroudWidget(
      title: S.current.situation_of_handling_people,
      child: Column(
        children:  [
          PieChart(chartData: [
            ChartData('Đang xử lý', 30, Color(0xffFF9F43)),
            ChartData('Đã quá hạn', 30, Color(0xffEA5455)),
            ChartData('Đã hoàn thành', 30, Color(0xff28C76F))
          ])
        ],
      ),
    );
  }
}
