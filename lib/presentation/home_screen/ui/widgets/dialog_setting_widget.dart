import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/config/themes/app_theme.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_item.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_screen.dart';

import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:ccvc_mobile/utils/enum_ext.dart';
import 'package:ccvc_mobile/widgets/radio/radio_button.dart';
import 'package:flutter/material.dart';

class DialogSettingWidget extends StatelessWidget {
  final List<DialogData>? listSelectKey;
  final Function(SelectKey)? onSelect;

  final HomeItemType type;
  const DialogSettingWidget(
      {Key? key, this.listSelectKey, this.onSelect, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return listSelectKey == null
        ? const SizedBox()
        : StreamBuilder<HomeItemType?>(
            stream: HomeProvider.of(context).homeCubit.showDialogSetting,
            builder: (context, snapshot) {
              return snapshot.data == type
                  ? Container(
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            List.generate(listSelectKey?.length ?? 0, (index) {
                          final data = listSelectKey?[index] ??
                              DialogData(key: [], title: '');

                          return Padding(
                            padding: EdgeInsets.only(top: index == 0 ? 0 : 26),
                            child: SelectCell(
                              data: data,
                            ),
                          );
                        }),
                      ),
                    )
                  : const SizedBox();
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
    // TODO: implement initState
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
              padding: const EdgeInsets.only(top: 16),
              child: GestureDetector(
                onTap: () {
                  selectKey = widget.data.key[index];
                },
                child: RadioButton<SelectKey>(
                  value: data,
                  title: data.getText(),
                  groupValue: selectKey,
                  onChange: (value) {
                    selectKey=value??SelectKey.HOM_NAY;
                    setState(() {

                    });
                  },
                ),
              ),
            );
          }),
        )
      ],
    );
  }
}

class DialogData {
  final String title;
  final List<SelectKey> key;
  final SelectKey initValue;

  DialogData({
    required this.title,
    required this.key,
    this.initValue = SelectKey.HOM_NAY,
  });
}
