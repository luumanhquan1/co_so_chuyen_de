import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/home_module/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/home_module/widgets/dialog/show_dialog.dart';
import 'package:ccvc_mobile/home_module/widgets/text/text/no_data_widget.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/todo_dscv_model.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_sach_cong_viec/bloc/danh_sach_cong_viec_tien_ich_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import 'cell_dscv_tien_tich.dart';

class CongViecDaHoanThanhWidget extends StatelessWidget {
  final DanhSachCongViecTienIchCubit cubit;
  const CongViecDaHoanThanhWidget({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TodoListModelTwo>(
      stream: cubit.getTodoList,
      builder: (context, snapshot) {
        final data = snapshot.data?.listTodoDone ??
            <TodoDSCVModel>[];
        if (data.isNotEmpty) {
          return Column(
            children: List.generate(data.length, (index) {
              final todo = data[index];
              return CongViecCellTienIch(
                enabled: false,
                todoModel: todo,
                onCheckBox: (value) {
                  cubit.tickerListWord(todo: todo);
                },
                onClose: () {
                  showDiaLog(
                    context,
                    funcBtnRight: () {
                      cubit.deleteCongViec(todo);
                    },
                    icon: SvgPicture.asset(
                      ImageAssets.icDeleteLichHop,
                    ),
                    title: S.current.xoa_cong_viec,
                    textContent:
                    S.current.ban_chac_chan_muon_xoa,
                    btnLeftTxt: S.current.huy,
                    btnRightTxt: S.current.xoa,
                  );
                },
                onStar: () {
                  cubit.tickerQuanTrongTodo(todo);
                },
                text: todo.label ?? '',
                onEdit: () {},
              );
            }),
          );
        }
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: NodataWidget(),
        );
      },
    );
  }
}
