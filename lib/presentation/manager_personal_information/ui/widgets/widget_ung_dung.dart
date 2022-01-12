import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/bloc/manager_personal_information_cubit.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/ui/widgets/widget_row_ung_dung_tablet.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class WidgetUngDung extends StatefulWidget {
  const WidgetUngDung({Key? key}) : super(key: key);

  @override
  _WidgetUngDungState createState() => _WidgetUngDungState();
}

class _WidgetUngDungState extends State<WidgetUngDung> {
  final ManagerPersonalInformationCubit _cubit =
      ManagerPersonalInformationCubit();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ứng dụng',
          style: titleAppbar(fontSize: 16.0.textScale()),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: _cubit.managerPersonalInformationModel
                  .toListUngDung()
                  .map(
                    (row) => WidgetRowUngDungTablet(
                      row: row,
                    ),
                  )
                  .toList(),
            )
          ],
        )
      ],
    );
  }
}
