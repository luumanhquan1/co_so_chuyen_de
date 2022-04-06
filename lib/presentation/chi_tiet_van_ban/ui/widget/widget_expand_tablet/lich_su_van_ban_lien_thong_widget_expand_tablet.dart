import 'package:ccvc_mobile/domain/model/detail_doccument/history_detail_document.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/chi_tiet_nhiem_vu/ui/widget/expand_only_nhiem_vu.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/bloc/detail_document_cubit.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/ui/widget/history_widget/history_widget.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:ccvc_mobile/widgets/text/no_data_widget.dart';
import 'package:flutter/material.dart';

class LichSuVanBanLienThongWidgetExpandTablet extends StatefulWidget {
  final DetailDocumentCubit cubit;

  LichSuVanBanLienThongWidgetExpandTablet({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<LichSuVanBanLienThongWidgetExpandTablet> createState() =>
      _LichSuVanBanLienThongWidgetExpandTabletState();
}

class _LichSuVanBanLienThongWidgetExpandTabletState
    extends State<LichSuVanBanLienThongWidgetExpandTablet> {
  @override
  Widget build(BuildContext context) {
    return ExpandOnlyNhiemVu(
      name: S.current.lich_su_van_ban_lien_thong,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0.textScale(space: 4),
        ),
        child: StreamBuilder<HistoryProcessPage>(
          stream: widget.cubit.screenJobProfilesStream,
          builder: (context, snapshot) {
            if (snapshot.hasData && widget.cubit.listHistory.isNotEmpty) {
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
    );
  }
}
