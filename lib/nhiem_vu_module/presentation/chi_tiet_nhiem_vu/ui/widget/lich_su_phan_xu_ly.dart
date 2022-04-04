
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/lich_su_phan_xu_ly.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/chi_tiet_nhiem_vu/bloc/chi_tiet_nhiem_vu_cubit.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/chi_tiet_nhiem_vu/ui/widget/expand_only_nhiem_vu.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/chi_tiet_nhiem_vu/ui/widget/widget_in_expand.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class LichSuPhanXuLyWidget extends StatelessWidget {
  final List<LichSuPhanXuLyNhiemVuModel> dataModel;
  final ChiTietNVCubit cubit;

  const LichSuPhanXuLyWidget(
      {Key? key, required this.dataModel, required this.cubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandOnlyNhiemVu(
      name: S.current.lich_su_phan_xu_ly,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0.textScale(space: 4),
        ),
        child: Column(
          children: dataModel
              .map(
                (e) => WidgetInExpand(
                  row: e.listLSPXL(),
                  cubit: cubit,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
