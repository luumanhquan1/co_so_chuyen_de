import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/home/document_dashboard_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/base_choose_time/ui/base_choose_time_screen.dart';
import 'package:ccvc_mobile/presentation/outgoing_document/bloc/outgoing_document_cubit.dart';
import 'package:ccvc_mobile/quanlivanban/bloc/qlvb_cubit.dart';
import 'package:ccvc_mobile/quanlivanban/ui/tablet/widgets/common_infor_tablet.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QLVBScreenTablet extends StatefulWidget {
  const QLVBScreenTablet({Key? key}) : super(key: key);

  @override
  _QLVBScreenTabletState createState() => _QLVBScreenTabletState();
}

class _QLVBScreenTabletState extends State<QLVBScreenTablet> {
  QLVBCCubit qlvbCubit = QLVBCCubit();
  OutgoingDocumentCubit cubit = OutgoingDocumentCubit();

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
      body: Container(
        color: bgQLVBTablet,
        child: Column(
          children: [
           Container(
             color: Colors.white,
             child: BaseChooseTimeScreen(today: DateTime.parse('2022-01-13'),),
           ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
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
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                color: bgQLVBTablet,
                child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    appBar: PreferredSize(
                      preferredSize: const Size.fromHeight(40.0),
                      child: AppBar(
                        backgroundColor: bgQLVBTablet,
                        elevation: 0.0,
                        bottom: TabBar(
                          labelColor: labelColor,
                          unselectedLabelColor: unselectedLabelColor,
                          indicatorColor: indicatorColor,
                          tabs: [
                            Text(S.current.danh_sach_van_ban_den),
                            Text(S.current.danh_sach_van_ban_di),
                          ],
                        ),
                      ),
                    ),
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: bgButtonDropDown.withOpacity(0.1),
                          ),
                          height: 40,
                          width: 250,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                S.current.chi_tiet_vb,
                                style: textNormalCustom(
                                  color: bgButtonDropDown,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              SvgPicture.asset(ImageAssets.ic_chitet),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // const TabBarView(
                        //   children: [
                        //     // ListView.builder(
                        //     //   physics: const NeverScrollableScrollPhysics(),
                        //     //   shrinkWrap: true,
                        //     //   itemCount: cubit.listIncomingDocument.length,
                        //     //   itemBuilder: (context, index) {
                        //     //     return IncomingDocumentCell(
                        //     //       title: cubit
                        //     //           .listIncomingDocument[index].loaiVanBan,
                        //     //       dateTime: cubit.listIncomingDocument[index]
                        //     //           .ngayBanHanh,
                        //     //       userName: cubit.listIncomingDocument[index]
                        //     //           .nguoiSoanThao,
                        //     //       status: cubit
                        //     //           .listIncomingDocument[index].doKhan,
                        //     //       userImage: '',
                        //     //     );
                        //     //   },
                        //     // ),
                        //     // ListView.builder(
                        //     //   physics: const NeverScrollableScrollPhysics(),
                        //     //   shrinkWrap: true,
                        //     //   itemCount: cubit.listIncomingDocument.length,
                        //     //   itemBuilder: (context, index) {
                        //     //     return IncomingDocumentCell(
                        //     //       title: cubit
                        //     //           .listIncomingDocument[index].loaiVanBan,
                        //     //       dateTime: cubit.listIncomingDocument[index]
                        //     //           .ngayBanHanh,
                        //     //       userName: cubit.listIncomingDocument[index]
                        //     //           .nguoiSoanThao,
                        //     //       status: cubit
                        //     //           .listIncomingDocument[index].doKhan,
                        //     //       userImage: '',
                        //     //     );
                        //     //   },
                        //     // ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // const SizedBox(
            //   height: 100,
            // ),
          ],
        ),
      ),
    );
  }
}
