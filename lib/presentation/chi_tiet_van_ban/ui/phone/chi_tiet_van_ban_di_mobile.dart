import 'package:auto_size_text/auto_size_text.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/chi_tiet_van_ban_di_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/bloc/detail_document_cubit.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/ui/widget/widget_expand_van_ban_di_mobile/widget_head_chi_tiet_van_ban_di.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:ccvc_mobile/widgets/select_only_expands/expand_group.dart';
import 'package:flutter/material.dart';

class ChiTietVanBanDiMobile extends StatefulWidget {
  final String id;
   ChiTietVanBanDiMobile({Key? key,required this.id }) : super(key: key);

  @override
  _ChiTietVanBanDiMobileState createState() => _ChiTietVanBanDiMobileState();
}

class _ChiTietVanBanDiMobileState extends State<ChiTietVanBanDiMobile> {
  DetailDocumentCubit cubit=DetailDocumentCubit();
  @override
  void initState() {
    cubit.getChiTietVanBanDi(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBarDefaultBack(S.current.chi_tiet_van_ban),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetHeadChiTietVanBanDi(cubit: cubit),
          ],
        ),
      ),
    );
  }
}
