import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/detail_document.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/bloc/detail_document_cubit.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/ui/tablet/widget/detail_document_row_tablet.dart';
import 'package:ccvc_mobile/widgets/text/no_data_widget.dart';
import 'package:flutter/material.dart';

class WidgetHeadChiTietVanBanTablet extends StatelessWidget {
  final DetailDocumentCubit cubit;

  const WidgetHeadChiTietVanBanTablet({Key? key, required this.cubit})
      : super(key: key);

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
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 20,
          left: 20,
          right: 20,
        ),
        child: StreamBuilder<DetailDocumentModel>(
          initialData: cubit.detailDocumentModel,
          stream: cubit.detailDocumentSubject,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: snapshot.data!.toListRow().map(
                  (row) {
                    return DetailDocumentRowTablet(
                      row: row,
                    );
                  },
                ).toList(),
              );
            } else {
              return const NodataWidget();
            }
          },
        ),
      ),
    );
  }
}
