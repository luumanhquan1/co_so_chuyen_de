import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_item.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_screen.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_backgroud_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/dialog_setting_widget.dart';
import 'package:ccvc_mobile/widgets/chart/base_pie_chart.dart';
import 'package:flutter/material.dart';

class SituationOfHandlingPeopleWidget extends StatefulWidget {
  final HomeItemType homeItemType;
  const SituationOfHandlingPeopleWidget({Key? key,required this.homeItemType}) : super(key: key);

  @override
  State<SituationOfHandlingPeopleWidget> createState() => _SituationOfHandlingPeopleWidgetState();
}

class _SituationOfHandlingPeopleWidgetState extends State<SituationOfHandlingPeopleWidget> {
  @override
  Widget build(BuildContext context) {
    return  ContainerBackgroundWidget(
      title: S.current.situation_of_handling_people,
      onTapIcon: (){
        HomeProvider.of(context).homeCubit.showDialog(widget.homeItemType);
      },
      dialogSelect: DialogSettingWidget(   type: widget.homeItemType,),
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
