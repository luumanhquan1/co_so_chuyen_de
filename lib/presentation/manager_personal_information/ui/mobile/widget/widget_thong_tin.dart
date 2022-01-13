import 'package:ccvc_mobile/presentation/manager_personal_information/bloc/manager_personal_information_cubit.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/ui/mobile/widget/widget_row_item_mobile.dart';
import 'package:flutter/material.dart';

class WidgetThongTinMobile extends StatefulWidget {
  const WidgetThongTinMobile({Key? key}) : super(key: key);

  @override
  State<WidgetThongTinMobile> createState() => _WidgetThongTinMobileState();
}

class _WidgetThongTinMobileState extends State<WidgetThongTinMobile> {
  final ManagerPersonalInformationCubit _cubit =
      ManagerPersonalInformationCubit();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: _cubit.managerPersonalInformationModel
              .toListMobile()
              .map(
                (row) => WidgetRowItemMobile(
                  row: row,
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
