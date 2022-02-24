import 'package:ccvc_mobile/domain/model/chi_tiet_nhiem_vu/handing_comment.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_nhiem_vu/lich_su_tra_lai.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_nhiem_vu/bloc/chi_tiet_nhiem_vu_cubit.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_nhiem_vu/ui/widget/comment_widget.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_nhiem_vu/ui/widget/send_comment_widget.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_nhiem_vu/ui/widget/widget_in_expand.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

import 'attack_button_file.dart';
import 'expand_only_nhiem_vu.dart';

class YKienNhiemVuWidget extends StatelessWidget {

  final ChiTietNVCubit cubit;

  const YKienNhiemVuWidget({Key? key,  required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ExpandOnlyNhiemVu(
      name: S.current.y_kien_xu_ly,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0.textScale(space: 4),
        ),
        child:Column(
          children: [
            const SizedBox(height: 17.0,),
            SendCommentWidget(
              isReComment: true,
              onSendComment:(text, listFile){

              },
            ),
            const SizedBox(height: 24.0,),
            AttackButtonWidget(
              onAddPresss: (totalFile, listFile) {
              },
              onRemovePress: (index) {
              },
            ),
            CommentWidget(
              object: handingComment,
            ),
          ],
        )
      ),
    );
  }
}
