
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/domain/model/home/document_dashboard_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/quanlivanban/bloc/qlvb_cubit.dart';
import 'package:ccvc_mobile/quanlivanban/ui/mobile/widgets/common_infor_mobile.dart';
import 'package:flutter/material.dart';
class QLVBScreenMobile extends StatefulWidget {
  const QLVBScreenMobile({Key? key}) : super(key: key);

  @override
  _QLVBScreenMobileState createState() => _QLVBScreenMobileState();
}

class _QLVBScreenMobileState extends State<QLVBScreenMobile> {
  QLVBCCubit qlvbCubit=QLVBCCubit();

   @override
  void initState() {
    super.initState();
    qlvbCubit.callAPi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            StreamBuilder<DocumentDashboardModel>(
              stream: qlvbCubit.getVbDen,
              builder: (context,snapshot){
                final dataVBDen=snapshot.data??DocumentDashboardModel();
                return
                  CommonInformationMobile( documentDashboardModel: dataVBDen,
                      isVbDen: true,
                      title: S.current.document_incoming,);
              },
            ),
            Container (height: 6,color: homeColor,),
            StreamBuilder<DocumentDashboardModel>(
              stream: qlvbCubit.getVbDi,
              builder: (context,snapshot){
                final dataVBDi=snapshot.data?? DocumentDashboardModel();
                return
                  CommonInformationMobile( documentDashboardModel: dataVBDi,
                    isVbDen: false,
                    title: S.current.document_out_going,);
              },
            ),
            Container (height: 6,color: homeColor,),
          ],
        ),
      ),
    );
  }
}
