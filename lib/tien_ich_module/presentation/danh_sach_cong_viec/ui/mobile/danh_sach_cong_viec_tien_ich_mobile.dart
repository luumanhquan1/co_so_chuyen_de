import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/home_module/domain/model/home/todo_model.dart';
import 'package:ccvc_mobile/home_module/presentation/home_screen/ui/mobile/items/work_list_widget.dart';
import 'package:ccvc_mobile/home_module/presentation/home_screen/ui/tablet/widgets/scroll_bar_widget.dart';
import 'package:ccvc_mobile/home_module/widgets/dialog/show_dialog.dart';
import 'package:ccvc_mobile/home_module/widgets/show_buttom_sheet/show_bottom_sheet.dart';
import 'package:ccvc_mobile/home_module/widgets/text/text/no_data_widget.dart';
import 'package:ccvc_mobile/ket_noi_module/widgets/drawer_slide/drawer_slide.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_sach_cong_viec/ui/widget/menu_dscv.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_sach_cong_viec/bloc/danh_sach_cong_viec_tien_ich_cubit.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_sach_cong_viec/ui/widget/cell_dscv_tien_tich.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_sach_cong_viec/ui/widget/chinh_sua_widget.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/appbar/app_bar_with_two_leading.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/search/base_search_bar.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';

class DanhSachCongViecTienIchMobile extends StatefulWidget {
  const DanhSachCongViecTienIchMobile({Key? key}) : super(key: key);

  @override
  _DanhSachCongViecTienIchMobileState createState() =>
      _DanhSachCongViecTienIchMobileState();
}

class _DanhSachCongViecTienIchMobileState
    extends State<DanhSachCongViecTienIchMobile> {
  DanhSachCongViecTienIchCubit cubit = DanhSachCongViecTienIchCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.getToDoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithTwoLeading(
        title: S.current.danh_sach_cong_viec,
        leadingIcon: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                ImageAssets.icBack,
              ),
            ),
          ],
        ),
        actions: [
          PopupMenuButton(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            icon: SvgPicture.asset(ImageAssets.Group3),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: AddToDoWidget(
                  onTap: (value) {
                    cubit.closeDialog();
                    cubit.addTodo(value);
                  },
                ),
              )
            ],
          ),
          IconButton(
            onPressed: () {
              DrawerSlide.navigatorSlide(
                context: context,
                screen: MenuDSCV(
                  cubit: cubit,
                  theoDangLich: () {},
                  TheoDangDanhSach: () {},
                ),
              );
            },
            icon: SvgPicture.asset(ImageAssets.icMenuCalender),
          )
        ],
      ),
      body: ScrollBarWidget(
        children: [
          BaseSearchBar(
            hintText: S.current.tim_kiem_nhanh,
            onChange: (value) {
              cubit.search(value);
            },
          ),
          StreamBuilder<TodoListModel>(
            stream: cubit.getTodoList,
            builder: (context, snapshot) {
              final data = snapshot.data?.listTodoImportant ?? <TodoModel>[];
              if (data.isNotEmpty) {
                return ListView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final todo = data[index];
                    return CongViecCellTienIch(
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
                      onEdit: () {
                        showBottomSheetCustom(
                          context,
                          title: S.current.chinh_sua,
                          child: EditWidget(
                            cubit: cubit,
                            todo: todo,
                          ),
                        );
                      },
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
          const SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.current.da_hoan_thanh,
                style: textNormalCustom(fontSize: 14, color: infoColor),
              ),
              StreamBuilder<TodoListModel>(
                stream: cubit.getTodoList,
                builder: (context, snapshot) {
                  final data = snapshot.data?.listTodoDone ?? <TodoModel>[];
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
                      }),
                    );
                  }
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: NodataWidget(),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
