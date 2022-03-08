import 'package:ccvc_mobile/domain/model/detail_doccument/history_detail_document.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/bloc/detail_document_cubit.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/ui/widget/dropdown_widget.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/ui/widget/history_widget/history_widget.dart';
import 'package:ccvc_mobile/widgets/text/no_data_widget.dart';
import 'package:flutter/material.dart';

class LichSuVanBanLienThongWidgetExpandTablet extends StatefulWidget {
  final DetailDocumentCubit cubit;
   bool expanded;

   LichSuVanBanLienThongWidgetExpandTablet(
      {Key? key, required this.cubit, required this.expanded})
      : super(key: key);

  @override
  State<LichSuVanBanLienThongWidgetExpandTablet> createState() => _LichSuVanBanLienThongWidgetExpandTabletState();
}

class _LichSuVanBanLienThongWidgetExpandTabletState extends State<LichSuVanBanLienThongWidgetExpandTablet> {
  @override
  Widget build(BuildContext context) {
    return  ExpansionTitleCustom(
      expand: widget.expanded,
      paddingRightIcon:
      const EdgeInsets.only(right: 21),
      title: Container(
        padding: const EdgeInsets.only(
          left: 16,
          top: 10.5,
          bottom: 10.5,
        ),
        child: Text(S.current.lich_su_van_ban_lien_thong),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        child: StreamBuilder<HistoryProcessPage>(
          stream: widget.cubit.screenJobProfilesStream,
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                widget.cubit.listHistory.isNotEmpty) {
              return HistoryWidget(widget.cubit);
            } else {
              return const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: NodataWidget(),
              );
            }
          },
        ),
      ),
      onChangeExpand: () {
        setState(() {
          widget.expanded = !widget.expanded;
        });
      },
    );
  }
}