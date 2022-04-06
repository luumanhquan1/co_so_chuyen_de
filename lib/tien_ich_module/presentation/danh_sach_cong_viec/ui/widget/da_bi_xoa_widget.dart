import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/home_module/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/home_module/widgets/dialog/show_dialog.dart';
import 'package:ccvc_mobile/home_module/widgets/text/text/no_data_widget.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/todo_dscv_model.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_sach_cong_viec/bloc/danh_sach_cong_viec_tien_ich_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'cell_dscv_tien_tich.dart';

class DaBiXoaWidget extends StatelessWidget {
  final DanhSachCongViecTienIchCubit cubit;

  const DaBiXoaWidget({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          StreamBuilder<List<TodoDSCVModel>>(
            stream: cubit.listGanChoToiDaXoa.stream,
            builder: (context, snapshot) {
              final data = snapshot.data ?? <TodoDSCVModel>[];
              if (data.isNotEmpty) {
                return ListView.builder(
                  key: UniqueKey(),
                  itemCount: data.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
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
                          textContent: S.current.ban_chac_chan_muon_xoa,
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
                  },
                );
              }
              return const SizedBox();
            },
          ),
          StreamBuilder<List<TodoDSCVModel>>(
            stream: cubit.listDaXoa.stream,
            builder: (context, snapshot) {
              final data = snapshot.data ?? <TodoDSCVModel>[];
              if (data.isNotEmpty) {
                return ListView.builder(
                  key: UniqueKey(),
                  itemCount: data.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final todo = data[index];
                    return CongViecCellTienIch(
                      enabled: false,
                      isTheEdit: true,
                      text: todo.label ?? '',
                      todoModel: todo,
                      onCheckBox: (value) {
                        cubit.tickerListWord(
                          todo: todo,
                          removeDone: false,
                        );
                      },
                      onStar: () {
                        cubit.tickerQuanTrongTodo(
                          todo,
                          removeDone: false,
                        );
                      },
                      onClose: () {
                        showDiaLog(
                          context,
                          funcBtnRight: () {
                            cubit.deleteCongViec(
                              todo,
                              removeDone: false,
                            );
                          },
                          icon: SvgPicture.asset(
                            ImageAssets.icDeleteLichHop,
                          ),
                          title: S.current.xoa_cong_viec,
                          textContent: S.current.ban_chac_chan_muon_xoa,
                          btnLeftTxt: S.current.huy,
                          btnRightTxt: S.current.xoa,
                        );
                      },
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
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
