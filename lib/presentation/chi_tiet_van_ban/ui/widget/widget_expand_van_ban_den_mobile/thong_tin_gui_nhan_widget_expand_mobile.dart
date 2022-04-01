import 'package:ccvc_mobile/domain/model/detail_doccument/thong_tin_gui_nhan.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_nhiem_vu/ui/widget/expand_only_nhiem_vu.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/bloc/detail_document_cubit.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/ui/widget/widget_in_expand_van_ban.dart';
import 'package:ccvc_mobile/widgets/text/no_data_widget.dart';
import 'package:flutter/material.dart';

class ThongTinGuiNhanExpandWidgetMobile extends StatelessWidget {
  final List<ThongTinGuiNhanModel> thongTinGuiNhanModel;
  final DetailDocumentCubit cubit;

  const ThongTinGuiNhanExpandWidgetMobile({
    Key? key,
    required this.thongTinGuiNhanModel,
    required this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandOnlyNhiemVu(
      name: S.current.thong_tin_gui_nhan,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: thongTinGuiNhanModel.isNotEmpty
              ? thongTinGuiNhanModel
                  .map(
                    (e) => WidgetInExpandVanBan(
                      row: e.toListRow(),
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
