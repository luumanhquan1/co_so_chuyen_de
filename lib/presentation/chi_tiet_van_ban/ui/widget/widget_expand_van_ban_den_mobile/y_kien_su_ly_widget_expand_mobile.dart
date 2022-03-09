import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_nhiem_vu/handing_comment.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/danh_sach_y_kien_xu_ly_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/bloc/detail_document_cubit.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/ui/phone/widget_phone/y_kien_xu_y.dart';
import 'package:ccvc_mobile/widgets/select_only_expands/expand_only_widget.dart';
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
    return ExpandOnlyWidget(
      header: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.transparent,
              child: Text(
                S.current.y_kien_xu_ly,
                style: textNormalCustom(color: titleColumn, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      child:
      StreamBuilder<List<DanhSachYKienXuLy>>(
          stream: cubit.danhSachYKienXuLyStream,
          builder: (context, snapshot) {
            final data=snapshot.data??[];
            if(data.isNotEmpty) {
              return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context,index){
                return YKienSuLyWidget(object: data[index],);
              },);}
              else {
                return const NodataWidget();
            }
          }
      ),
    );
  }
}
