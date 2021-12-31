import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_backgroud_widget.dart';
import 'package:ccvc_mobile/widgets/chart/base_pie_chart.dart';
import 'package:flutter/material.dart';

class WordProcessingStateWidget extends StatelessWidget {
  const WordProcessingStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   ContainerBackgroudWidget(
      title: S.current.word_processing_state,
      child: Column(
        children: [
          PieChart(
            paddingTop: 0,
            title: S.current.document_incoming,
            chartData: [
              ChartData('Chờ xử lý', 5, Color(0xff5A8DEE)),
              ChartData('Đang xử lý', 0, Color(0xff7966FF)),
              ChartData('Đã xử lý', 17, Color(0xff28C76F)),
              ChartData('Chờ vào sổ', 4, Color(0xffFF9F43)),
            ],
          ),
          PieChart(
            title: S.current.document_out_going,
            chartData: [
              ChartData('Chờ trình ký', 30, Color(0xff02C5DD)),
              ChartData('Chờ xử lý', 12, Color(0xff5A8DEE)),
              ChartData('Đã xử lý', 14, Color(0xff28C76F)),
              ChartData('Chờ cấp số', 14, Color(0xffFF6D99)),
              ChartData('Chờ ban hành', 13, Color(0xff374FC7))
            ],
          )
        ],
      ),
    );
  }
}
