import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/domain/model/home/document_dashboard_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/quanlivanban/bloc/qlvb_cubit.dart';
import 'package:ccvc_mobile/quanlivanban/ui/widgets/box_satatus_vb.dart';
import 'package:ccvc_mobile/widgets/chart/base_pie_chart.dart';
import 'package:flutter/material.dart';
class CommonInformationMobile extends StatefulWidget {
  const CommonInformationMobile({Key? key}) : super(key: key);

  @override
  _CommonInformationMobileState createState() => _CommonInformationMobileState();
}

class _CommonInformationMobileState extends State<CommonInformationMobile> {
  QLVBCCubit qlvbcCubit=QLVBCCubit();

  @override
  void initState() {
    super.initState();
    qlvbcCubit.callAPi();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(20),
      color: Colors.red,
      child: StreamBuilder<DocumentDashboardModel>(
        stream: qlvbcCubit.getVbDen,
        builder: (context,snapshot){
          final data=snapshot.data ??DocumentDashboardModel();
          return Column(
            children: [
            PieChart(
            title: S.current.document_incoming,
            chartData: [
              ChartData(
                S.current.cho_xu_ly,
                data.soLuongChoXuLy?.toDouble() ?? 0,
                choXuLyColor,
              ),
              ChartData(
                S.current.dang_xu_ly,
                data.soLuongDangXuLy?.toDouble() ?? 0,
                dangXyLyColor,
              ),
              ChartData(
                S.current.da_xu_ly,
                data.soLuongDaXuLy?.toDouble() ?? 0,
                daXuLyColor,
              ),
              ChartData(
                S.current.cho_vao_so,
                data.soLuongChoVaoSo?.toDouble() ?? 0,
                choVaoSoColor,
              ),
            ],
            onTap: (int value){

            },
          ),
               Container(height: 20,color: Colors.blue,),
              Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 BoxStatusVanBan(value: data.soLuongTrongHan.toString(),
                   onTap: () {  }, color: numberOfCalenders,
                   statusName: S.current.trong_han,),
                 BoxStatusVanBan(value: data.soLuongQuaHan.toString(),
                   onTap: () {  }, color: statusCalenderRed,
                   statusName: S.current.qua_han,),
                 BoxStatusVanBan(value: data.soLuongThuongKhan.toString(),
                   onTap: () {  }, color: textColorForum,
                   statusName: S.current.thuong_khan,),
               ],
              )
            ],
          );
        },
      ),

    );
  }
}
