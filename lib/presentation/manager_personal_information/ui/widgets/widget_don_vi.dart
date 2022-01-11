import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/bloc/manager_personal_information_cubit.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/ui/items/widget_row_item.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class WidgetDonVi extends StatefulWidget {
  const WidgetDonVi({Key? key}) : super(key: key);

  @override
  _WidgetDonViState createState() => _WidgetDonViState();
}

class _WidgetDonViState extends State<WidgetDonVi> {
  final ManagerPersonalInformationCubit _cubit = ManagerPersonalInformationCubit();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Đơn vị',
            style: titleAppbar(color: textTitle, fontSize: 16.0.textScale()),),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
                children: _cubit.managerPersonalInformationModel
                    .toListDonVi()
                    .map((row) => WidgetRowItem(
                          row: row,
                        ))
                    .toList())
          ],
        )
      ],
    );
  }
}
