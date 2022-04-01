import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/chi_tiet_nhiem_vu/ui/widget/expand_only_nhiem_vu.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/bloc/detail_document_cubit.dart';
import 'package:ccvc_mobile/widgets/text/no_data_widget.dart';
import 'package:flutter/material.dart';

class VBDiTheoDoiVanBanBanHanhExpandWidget extends StatelessWidget {
  final DetailDocumentCubit cubit;

  VBDiTheoDoiVanBanBanHanhExpandWidget({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandOnlyNhiemVu(
      name: S.current.theo_doi_van_ban_da_ban_hanh,
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(

           children: [
             Padding(
               padding: EdgeInsets.only(top: 16.0),
               child: NodataWidget(),
             )
           ],

        ),
      ),
    );
  }
}
