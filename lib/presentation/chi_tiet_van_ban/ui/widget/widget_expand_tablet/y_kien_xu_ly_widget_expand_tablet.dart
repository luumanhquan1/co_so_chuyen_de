import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/danh_sach_y_kien_xu_ly_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_nhiem_vu/ui/widget/expand_only_nhiem_vu.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/bloc/detail_document_cubit.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/ui/widget/y_kien_su_ly_widget.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:ccvc_mobile/widgets/text/no_data_widget.dart';
import 'package:flutter/material.dart';

class YKienSuLyWidgetExpandTablet extends StatefulWidget {
  final DetailDocumentCubit cubit;

  const YKienSuLyWidgetExpandTablet({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<YKienSuLyWidgetExpandTablet> createState() =>
      _YKienSuLyWidgetExpandTabletState();
}

class _YKienSuLyWidgetExpandTabletState
    extends State<YKienSuLyWidgetExpandTablet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: borderButtomColor,
        ),
        color: backgroundColorApp,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: ExpandOnlyNhiemVu(
        name: S.current.y_kien_xu_ly,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0.textScale(space: 4),
          ),
          child: StreamBuilder<List<DanhSachYKienXuLy>>(
              stream: widget.cubit.danhSachYKienXuLyStream,
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
      ),
    );
  }
}
