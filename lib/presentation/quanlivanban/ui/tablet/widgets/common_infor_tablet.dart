import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/domain/model/home/document_dashboard_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/quanlivanban/bloc/qlvb_cubit.dart';
import 'package:ccvc_mobile/presentation/quanlivanban/ui/widgets/box_satatus_vb.dart';
import 'package:ccvc_mobile/widgets/chart/base_pie_chart.dart';
import 'package:flutter/material.dart';
class CommonInformationTablet extends StatefulWidget {
  final DocumentDashboardModel documentDashboardModel;
  final String? title;
  final bool isVbDen;
  const CommonInformationTablet({Key? key,
    required this.documentDashboardModel,this.title,required this.isVbDen,})
      : super(key: key);

  @override
  _CommonInformationTabletState createState() =>
      _CommonInformationTabletState();
}

class _CommonInformationTabletState extends State<CommonInformationTablet> {
  QLVBCCubit qlvbcCubit=QLVBCCubit();

  @override
  void initState() {
    super.initState();
    qlvbcCubit.callAPi();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          PieChart(
            title: widget.title??'',
            chartData: widget.isVbDen? qlvbcCubit.chartDataVbDen
                :qlvbcCubit.chartDataVbDi,
            onTap: (int value){

            },
          ),
          Container(height: 20),
          if (widget.isVbDen) Row(
            children: [
              Expanded(
                child: BoxStatusVanBan(value: widget.documentDashboardModel
                    .soLuongTrongHan.toString(),
                  onTap: () {  }, color: numberOfCalenders,
                  statusName: S.current.trong_han,),
              ),
              const SizedBox(width: 16,),
              Expanded(
                child: BoxStatusVanBan(value: widget.documentDashboardModel
                    .soLuongQuaHan.toString(),
                  onTap: () {  }, color: statusCalenderRed,
                  statusName: S.current.qua_han,),
              ),
              const SizedBox(width: 16,),
              Expanded(
                child: BoxStatusVanBan(value: widget.documentDashboardModel
                    .soLuongThuongKhan.toString(),
                  onTap: () {  }, color: textColorForum,
                  statusName: S.current.thuong_khan,),
              ),
            ],
          ) else SizedBox(
            width: 103,
            child: BoxStatusVanBan(value: widget.documentDashboardModel
                .soLuongThuongKhan.toString(),
              onTap: () {  }, color: textColorForum,
              statusName: S.current.thuong_khan,),
          ),
        ],
      ),
    );
  }
}
