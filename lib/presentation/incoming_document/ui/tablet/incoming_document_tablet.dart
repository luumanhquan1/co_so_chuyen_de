import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/incoming_document/bloc/incoming_document_cubit.dart';
import 'package:ccvc_mobile/presentation/incoming_document/widget/incoming_document_dell_tablet.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IncomingDocumentScreenTablet extends StatefulWidget {
  const IncomingDocumentScreenTablet({Key? key}) : super(key: key);

  @override
  _IncomingDocumentScreenTabletState createState() =>
      _IncomingDocumentScreenTabletState();
}

class _IncomingDocumentScreenTabletState
    extends State<IncomingDocumentScreenTablet> {
  IncomingDocumentCubit cubit = IncomingDocumentCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultBack(S.current.danh_sach_van_ban_den),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(height: 28.0),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: cubit.listIncomingDocument.length,
                itemBuilder: (context, index) {
                  return IncomingDocumentCellTablet(
                    onTap: () {},
                    title: cubit.listIncomingDocument[index].loaiVanBan,
                    dateTime: cubit.listIncomingDocument[index].ngayTao,
                    userName: cubit.listIncomingDocument[index].nguoiSoanThao,
                    status: cubit.listIncomingDocument[index].doKhan,
                    userImage: '',
                    index: index,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
