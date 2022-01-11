
import 'package:ccvc_mobile/presentation/manager_personal_information/bloc/manager_personal_information_cubit.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/ui/items/widget_row_item.dart';
import 'package:flutter/material.dart';

class WidgetThongTinLeft extends StatefulWidget {
  const WidgetThongTinLeft({Key? key}) : super(key: key);

  @override
  State<WidgetThongTinLeft> createState() => _WidgetThongTinLeftState();
}

class _WidgetThongTinLeftState extends State<WidgetThongTinLeft> {
  final ManagerPersonalInformationCubit _cubit = ManagerPersonalInformationCubit();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
              children: _cubit.managerPersonalInformationModel
                  .toListRowDetailJob()
                  .map((row) => WidgetRowItem(
                        row: row,
                      ))
                  .toList()),
        )
      ],
    );
  }
}
