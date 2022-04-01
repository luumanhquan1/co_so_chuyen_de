import 'package:ccvc_mobile/domain/model/detail_doccument/danh_sach_y_kien_xu_ly_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_nhiem_vu/ui/widget/expand_only_nhiem_vu.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/bloc/detail_document_cubit.dart';
import 'package:ccvc_mobile/widgets/text/no_data_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../y_kien_su_ly_widget.dart';

class YKienXuLyExpandWidgetMobile extends StatelessWidget {
  final DetailDocumentCubit cubit;

  const YKienXuLyExpandWidgetMobile({Key? key, required this.cubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandOnlyNhiemVu(
      name: S.current.y_kien_xu_ly,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: StreamBuilder<List<DanhSachYKienXuLy>>(
            stream: cubit.danhSachYKienXuLyStream,
            builder: (context, snapshot) {
              final data = snapshot.data ?? [];
              if (data.isNotEmpty) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return YKienSuLyWidget(
                      object: data[index],
                    );
                  },
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: NodataWidget(),
                );
              }
            }),
      ),
    );
  }
}
