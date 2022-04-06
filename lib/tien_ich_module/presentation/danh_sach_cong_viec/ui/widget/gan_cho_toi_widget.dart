import 'package:ccvc_mobile/home_module/widgets/text/text/no_data_widget.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/todo_dscv_model.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_sach_cong_viec/bloc/danh_sach_cong_viec_tien_ich_cubit.dart';
import 'package:flutter/cupertino.dart';

import 'cell_dscv_tien_tich.dart';

class GanChoToiWidget extends StatelessWidget {
  final DanhSachCongViecTienIchCubit cubit;

  const GanChoToiWidget({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: StreamBuilder<List<TodoDSCVModel>>(
        stream: cubit.listGanChoToi.stream,
        builder: (context, snapshot) {
          final data = snapshot.data ?? [];
          if (data.isNotEmpty) {
            return ListView.builder(
              key: UniqueKey(),
              itemCount: data.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final todo = data[index];
                return CongViecCellTienIch(
                  isTheEdit: true,
                  text: todo.label ?? '',
                  todoModel: todo,
                  onCheckBox: (value) {},
                  onStar: () {},
                  onClose: () {},
                  onChange: (controller) {
                    cubit.changeLabelTodo(
                      controller.text.trim(),
                      todo,
                    );
                  },
                  onEdit: () {},
                );
              },
            );
          }
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: NodataWidget(),
          );
        },
      ),
    );
  }
}
