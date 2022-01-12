import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/domain/model/home/document_dashboard_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/quanlivanban/bloc/qlvb_cubit.dart';
import 'package:ccvc_mobile/quanlivanban/ui/tablet/widgets/common_infor_tablet.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';

class QLVBScreenTablet extends StatefulWidget {
  const QLVBScreenTablet({Key? key}) : super(key: key);

  @override
  _QLVBScreenTabletState createState() => _QLVBScreenTabletState();
}

class _QLVBScreenTabletState extends State<QLVBScreenTablet> {
  QLVBCCubit qlvbCubit = QLVBCCubit();

  @override
  void initState() {
    super.initState();
    qlvbCubit.callAPi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultBack(
        S.current.thong_tin_chung,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
          color: bgQLVBTablet,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor.withOpacity(0.5)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: StreamBuilder<DocumentDashboardModel>(
                        stream: qlvbCubit.getVbDen,
                        builder: (context, snapshot) {
                          final dataVBDen =
                              snapshot.data ?? DocumentDashboardModel();
                          return CommonInformationTablet(
                            documentDashboardModel: dataVBDen,
                            isVbDen: true,
                            title: S.current.document_incoming,
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder<DocumentDashboardModel>(
                        stream: qlvbCubit.getVbDi,
                        builder: (context, snapshot) {
                          final dataVBDi =
                              snapshot.data ?? DocumentDashboardModel();
                          return CommonInformationTablet(
                            documentDashboardModel: dataVBDi,
                            isVbDen: false,
                            title: S.current.document_out_going,
                          );
                        },
                      ),
                    ),
                    // DefaultTabController(
                    //   length: 2,
                    //   child: Scaffold(
                    //     appBar: AppBar(
                    //       bottom: const TabBar(
                    //         tabs: [
                    //           Text('tab1'),
                    //           Text('tab2'),
                    //         ],
                    //       ),
                    //
                    //     ),
                    //     body:const TabBarView(
                    //       children: [
                    //         Center(child: Text('Tab1'),),
                    //         Center(child: Text('Tab2'),),
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
