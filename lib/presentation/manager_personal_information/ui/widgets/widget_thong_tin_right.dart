import 'package:ccvc_mobile/presentation/manager_personal_information/bloc/manager_personal_information_cubit.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/ui/mobile/widget/widget_row_item.dart';
import 'package:flutter/material.dart';

class WidgetThongTinRight extends StatefulWidget {
  const WidgetThongTinRight({Key? key}) : super(key: key);

  @override
  State<WidgetThongTinRight> createState() => _WidgetThongTinRightState();
}

class _WidgetThongTinRightState extends State<WidgetThongTinRight> {
  final ManagerPersonalInformationCubit _cubit =
      ManagerPersonalInformationCubit();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            children: _cubit.managerPersonalInformationModel
                .toListAdress()
                .map(
                  (row) => WidgetRowItem(
                    row: row,
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}
