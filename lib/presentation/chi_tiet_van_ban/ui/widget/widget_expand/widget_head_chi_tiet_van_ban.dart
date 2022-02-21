import 'package:auto_size_text/auto_size_text.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/detail_document.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/bloc/detail_document_cubit.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/ui/widget/detail_document_row/detail_document_row_widget.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/ui/widget/khong_co_du_lieu_widget.dart';
import 'package:ccvc_mobile/presentation/login/ui/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';

class WidgetHeadChiTietVanBan extends StatelessWidget {
  final DetailDocumentCubit cubit;

  const WidgetHeadChiTietVanBan({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DetailDocumentModel>(
      initialData: cubit.detailDocumentModel,
      stream: cubit.detailDocumentSubject,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Column(
                children: snapshot.data!.toListRow().map(
                      (row) {
                    return DetailDocumentRow(
                      row: row,
                    );
                  },
                ).toList(),
              ),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 3.9,
                children: snapshot.data!
                    .toListCheckBox()
                    .map(
                      (row) => Row(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 41,
                        child: CustomCheckBox(
                          title: '',
                          isCheck: row.value,
                          onChange: (bool check) {},
                        ),
                      ),
                      AutoSizeText(
                        row.title,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xff667793),
                        ),
                      ),
                    ],
                  ),
                )
                    .toList(),
              )
            ],
          );
        } else {
          return  const KhongCoDuLieuWidget();
        }
      },
    );
  }
}
