import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/chi_tiet_van_ban_di_model.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/thong_tin_gui_nhan.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_nhiem_vu/ui/widget/expand_only_nhiem_vu.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/bloc/detail_document_cubit.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/ui/widget/widget_in_expand_van_ban.dart';
import 'package:ccvc_mobile/widgets/select_only_expands/expand_only_widget.dart';
import 'package:ccvc_mobile/widgets/text/no_data_widget.dart';
import 'package:flutter/material.dart';

class VBDiThongTinKyDuyetExpandWidgetMobile extends StatelessWidget {
  final List<NguoiKyDuyetModel> nguoiKyDuyetModel;
  final DetailDocumentCubit cubit;

  const VBDiThongTinKyDuyetExpandWidgetMobile({
    Key? key,
    required this.nguoiKyDuyetModel,
    required this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandOnlyNhiemVu(
      name: S.current.thong_tin_ky_duyet,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: nguoiKyDuyetModel.isNotEmpty
              ? nguoiKyDuyetModel
              .map(
                (e) => WidgetInExpandVanBan(
              row: e.toListRowKyDuyet(),
              cubit: cubit,
            ),
          )
              .toList()
              : [
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: NodataWidget(),
            )
          ],
        ),
      ),
    );
  }
}
