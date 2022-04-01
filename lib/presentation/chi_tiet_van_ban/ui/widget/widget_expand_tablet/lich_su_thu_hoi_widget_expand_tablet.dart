import 'package:ccvc_mobile/domain/model/detail_doccument/lich_su_van_ban_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/chi_tiet_nhiem_vu/ui/widget/expand_only_nhiem_vu.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/bloc/detail_document_cubit.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/ui/widget/widget_in_expand_van_ban.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:ccvc_mobile/widgets/text/no_data_widget.dart';
import 'package:flutter/material.dart';

class LichSuThuHoiWidgetExpandTablet extends StatefulWidget {
  final List<LichSuVanBanModel> lichSuVanBanThuHoiModel;
  final DetailDocumentCubit cubit;

  LichSuThuHoiWidgetExpandTablet({
    Key? key,
    required this.cubit,
    required this.lichSuVanBanThuHoiModel,
  }) : super(key: key);

  @override
  State<LichSuThuHoiWidgetExpandTablet> createState() =>
      _LichSuThuHoiWidgetExpandTabletState();
}

class _LichSuThuHoiWidgetExpandTabletState
    extends State<LichSuThuHoiWidgetExpandTablet> {
  @override
  Widget build(BuildContext context) {
    return ExpandOnlyNhiemVu(
      name: S.current.lich_su_thu_hoi,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0.textScale(space: 4),
        ),
        child: Column(
          children: widget.lichSuVanBanThuHoiModel.isNotEmpty
              ? widget.lichSuVanBanThuHoiModel
                  .map(
                    (e) => WidgetInExpandVanBan(
                      cubit: widget.cubit,
                      row: e.toListRowLichSuThuHoi(),
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
