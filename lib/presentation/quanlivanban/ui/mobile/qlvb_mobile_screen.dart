import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/home/document_dashboard_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/incoming_document/ui/tablet/imcoming_document_tablet.dart';
import 'package:ccvc_mobile/presentation/incoming_document/widget/incoming_document_cell.dart';
import 'package:ccvc_mobile/presentation/outgoing_document/bloc/outgoing_document_cubit.dart';
import 'package:ccvc_mobile/presentation/outgoing_document/ui/tablet/outgoing_document_tablet.dart';
import 'package:ccvc_mobile/presentation/quanlivanban/bloc/qlvb_cubit.dart';
import 'package:ccvc_mobile/presentation/quanlivanban/ui/mobile/widgets/common_infor_mobile.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QLVBScreenMobile extends StatefulWidget {
  const QLVBScreenMobile({Key? key}) : super(key: key);

  @override
  _QLVBScreenMobileState createState() => _QLVBScreenMobileState();
}

class _QLVBScreenMobileState extends State<QLVBScreenMobile> {
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
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            StreamBuilder<DocumentDashboardModel>(
              stream: qlvbCubit.getVbDen,
              builder: (context, snapshot) {
                final dataVBDen = snapshot.data ?? DocumentDashboardModel();
                return CommonInformationMobile(
                  documentDashboardModel: dataVBDen,
                  isVbDen: true,
                  title: S.current.document_incoming,
                );
              },
            ),
            Container(
              height: 6,
              color: homeColor,
            ),
            StreamBuilder<DocumentDashboardModel>(
              stream: qlvbCubit.getVbDi,
              builder: (context, snapshot) {
                final dataVBDi = snapshot.data ?? DocumentDashboardModel();
                return CommonInformationMobile(
                  documentDashboardModel: dataVBDi,
                  isVbDen: false,
                  title: S.current.document_out_going,
                );
              },
            ),
            Container(
              height: 6,
              color: homeColor,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.current.danh_sach_van_ban_den,
                        style: textNormalCustom(
                          fontSize: 16,
                          color: textDropDownColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const IncomingDocumentScreenTablet(),),);
                        },
                        icon: SvgPicture.asset(ImageAssets.ic_next_color),
                      )
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cubit.listIncomingDocument.length,
                    itemBuilder: (context, index) {
                      return IncomingDocumentCell(
                        title: cubit.listIncomingDocument[index].loaiVanBan,
                        dateTime: cubit.listIncomingDocument[index].ngayBanHanh,
                        userName:
                            cubit.listIncomingDocument[index].nguoiSoanThao,
                        status: cubit.listIncomingDocument[index].doKhan,
                        userImage: '',
                      );
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cubit.listIncomingDocument.length,
                    itemBuilder: (context, index) {
                      return IncomingDocumentCell(
                        title: cubit.listIncomingDocument[index].loaiVanBan,
                        dateTime: cubit.listIncomingDocument[index].ngayBanHanh,
                        userName:
                            cubit.listIncomingDocument[index].nguoiSoanThao,
                        status: cubit.listIncomingDocument[index].doKhan,
                        userImage: '',
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 6,
              color: homeColor,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.current.danh_sach_van_ban_di,
                        style: textNormalCustom(
                          fontSize: 16,
                          color: textDropDownColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const OutgoingDocumentScreenTablet(),),);
                        },
                        icon: SvgPicture.asset(ImageAssets.ic_next_color),
                      )
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cubit.listIncomingDocument.length,
                    itemBuilder: (context, index) {
                      return IncomingDocumentCell(
                        title: cubit.listIncomingDocument[index].loaiVanBan,
                        dateTime: cubit.listIncomingDocument[index].ngayBanHanh,
                        userName:
                            cubit.listIncomingDocument[index].nguoiSoanThao,
                        status: cubit.listIncomingDocument[index].doKhan,
                        userImage: '',
                      );
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cubit.listIncomingDocument.length,
                    itemBuilder: (context, index) {
                      return IncomingDocumentCell(
                        title: cubit.listIncomingDocument[index].loaiVanBan,
                        dateTime: cubit.listIncomingDocument[index].ngayBanHanh,
                        userName:
                            cubit.listIncomingDocument[index].nguoiSoanThao,
                        status: cubit.listIncomingDocument[index].doKhan,
                        userImage: '',
                      );
                    },
                  ),
                ],
              ),
            ),

            // const OutgoingDocumentScreen(),
          ],
        ),
      ),
    );
  }
}
