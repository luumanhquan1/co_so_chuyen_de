import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/config/themes/app_theme.dart';
import 'package:ccvc_mobile/domain/model/home/todo_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/bloc/home_cubit.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_item.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_screen.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/cong_viec_cell.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_backgroud_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/dialog_setting_widget.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/text/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WorkListWidget extends StatefulWidget {
  final HomeItemType homeItemType;
  const WorkListWidget({Key? key, required this.homeItemType})
      : super(key: key);

  @override
  _WorkListWidgetState createState() => _WorkListWidgetState();
}

class _WorkListWidgetState extends State<WorkListWidget> {
  late HomeCubit cubit;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    cubit = HomeProvider.of(context).homeCubit..getToDoList();
  }

  @override
  Widget build(BuildContext context) {
    return ContainerBackgroundWidget(
      spacingTitle: 0,
      paddingChild: const EdgeInsets.only(top: 20),
      title: S.current.work_list,
      urlIcon: ImageAssets.icPlus,
      onTapIcon: () {
        HomeProvider.of(context).homeCubit.showDialog(widget.homeItemType);
      },
      dialogSelect: DialogSettingWidget(
        type: widget.homeItemType,
        customDialog: AddToDoWidget(
          onTap: (value) {
            cubit.showDialog(null);
            cubit.addTodo(value);
          },
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder<TodoListModel>(
            stream: cubit.getTodoList,
            builder: (context, snapshot) {
              final data = snapshot.data?.listTodoImportant ?? <TodoModel>[];
              if (data.isNotEmpty) {
                return Column(
                  children: List.generate(data.length, (index) {
                    final todo = data[index];
                    return CongViecCell(
                      key: ValueKey(todo.id),
                      text: todo.label ?? '',
                      todoModel: todo,
                      onCheckBox: (value) {
                        cubit.tickerListWord(todo: todo, removeDone: false);
                      },
                      onStar: () {
                        cubit.tickerQuanTrongTodo(todo, removeDone: false);
                      },
                      onClose: () {},
                      onChange: (controller) {
                        final result =
                            cubit.changeLabelTodo(controller.text.trim(), todo);
                        controller.text = result;
                      },
                    );
                  }),
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
                        return CongViecCell(
                          key: ValueKey(todo.id),
                          enabled: false,
                          todoModel: todo,
                          onCheckBox: (value) {
                            cubit.tickerListWord(todo: todo);
                          },
                          onClose: () {},
                          onStar: () {
                            cubit.tickerQuanTrongTodo(todo);
                          },
                          text: todo.label ?? '',
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

class AddToDoWidget extends StatefulWidget {
  final Function(String) onTap;
  const AddToDoWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  _AddToDoWidgetState createState() => _AddToDoWidgetState();
}

class _AddToDoWidgetState extends State<AddToDoWidget> {
  bool isAdd = false;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.current.them_cong_viec,
                style: textNormalCustom(
                  color: AppTheme.getInstance().titleColor(),
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 18,
                height: 18,
                child: Checkbox(
                  checkColor: Colors.white, // color of tick Mark
                  activeColor: !isAdd ? sideTextInactiveColor : indicatorColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  side: const BorderSide(width: 1.5, color: lineColor),
                  value: true,
                  onChanged: (value) {
                    if (isAdd) {
                      widget.onTap(controller.text.trim());
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: borderButtomColor)),
            ),
            child: TextFormField(
              controller: controller,
              onChanged: (value) {
                if (value.isEmpty) {
                  isAdd = false;
                } else {
                  isAdd = true;
                }
                setState(() {});
              },
              style: textNormal(infoColor, 14),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIconConstraints:
                    const BoxConstraints(maxWidth: 25, maxHeight: 14),
                prefixIcon: Container(
                  color: Colors.transparent,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset(
                      ImageAssets.icEdit,
                      width: 14,
                      height: 14,
                    ),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                isDense: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
