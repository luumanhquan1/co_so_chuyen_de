import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/config/themes/app_theme.dart';
import 'package:ccvc_mobile/domain/model/widget_manage/widget_model.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_provider.dart';

import 'package:ccvc_mobile/utils/constants/app_constants.dart';

import 'package:ccvc_mobile/utils/enum_ext.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';

import 'package:flutter/material.dart';

class DialogSettingWidget extends StatelessWidget {
  final List<DialogData>? listSelectKey;
  final Function(SelectKey)? onSelect;
  final Widget? customDialog;
  final WidgetType type;
  final Widget? labelWidget;
  const DialogSettingWidget({
    Key? key,
    this.listSelectKey,
    this.onSelect,
    required this.type,
    this.customDialog,
    this.labelWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return listSelectKey == null && customDialog == null
        ? const SizedBox()
        : StreamBuilder<WidgetType?>(
            stream: HomeProvider.of(context).homeCubit.showDialogSetting,
            builder: (context, snapshot) {
              return Visibility(
                maintainState: true,
                visible: snapshot.data == type,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppTheme.getInstance().backGroundColor(),
                    boxShadow: [
                      BoxShadow(
                        color: shadowContainerColor.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(color: borderColor.withOpacity(0.5)),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: customDialog ??
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          labelWidget ?? const SizedBox(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(listSelectKey?.length ?? 0,
                                (index) {
                              final data = listSelectKey![index];
                              return Padding(
                                padding: EdgeInsets.only(
                                  top: index == 0 ? 0 : 20,
                                ),
                                child: SelectCell(
                                  data: data,
                                  onSelect: (value) {
                                    data.onSelect(value);
                                  },
                                ),
                              );
                            }),
                          )
                        ],
                      ),
                ),
              );
            },
          );
  }
}

class SelectCell extends StatefulWidget {
  final DialogData data;
  final Function(SelectKey)? onSelect;
  const SelectCell({Key? key, required this.data, this.onSelect})
      : super(key: key);

  @override
  _SelectCellState createState() => _SelectCellState();
}

class _SelectCellState extends State<SelectCell> {
  late SelectKey selectKey;
  @override
  void initState() {
    super.initState();
    selectKey = widget.data.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.data.title,
          style: textNormalCustom(
            fontSize: 16,
            color: AppTheme.getInstance().titleColor(),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(widget.data.key.length, (index) {
            final data = widget.data.key[index];
            return Padding(
              padding: EdgeInsets.only(top: index == 0 ? 12 : 8),
              child: MenuSelectCell<SelectKey>(
                value: data,
                title: data.getText(),
                groupValue: selectKey,
                onChange: (value) {
                  selectKey = value ?? SelectKey.HOM_NAY;
                  if (widget.onSelect != null) {
                    widget.onSelect!(selectKey);
                  }
                  setState(() {});
                },
              ),
            );
          }),
        )
      ],
    );
  }
}

class MenuSelectCell<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final Function(T?) onChange;
  final String title;
  const MenuSelectCell({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChange,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChange(value);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: value == groupValue ? buttonColor : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Text(
          title,
          style: textNormalCustom(
            color:
                value == groupValue ? backgroundColorApp : unselectLabelColor,
            fontSize: 14.0.textScale(),
          ),
        ),
      ),
    );
  }
}

class DialogData {
  final String title;
  final List<SelectKey> key;
  final SelectKey initValue;
  final Function(SelectKey) onSelect;
  DialogData(
      {required this.title,
      required this.key,
      this.initValue = SelectKey.HOM_NAY,
      required this.onSelect,});
}
