import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/bloc/manager_personal_information_cubit.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/ui/mobile/items/widget_row_item_mobile.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class WidgetUngDungMobile extends StatefulWidget {
  const WidgetUngDungMobile({Key? key}) : super(key: key);

  @override
  _WidgetUngDungMobileState createState() => _WidgetUngDungMobileState();
}

class _WidgetUngDungMobileState extends State<WidgetUngDungMobile> {
  final ManagerPersonalInformationCubit _cubit =
      ManagerPersonalInformationCubit();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Đơn vị',
          style: titleAppbar(color: textTitle, fontSize: 14.0.textScale()),
        ),
        spaceH16,
        Container(
          padding: const EdgeInsets.only(top: 6,left: 16),
          decoration: BoxDecoration(
            color: borderItemCalender.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: borderItemCalender),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: _cubit.managerPersonalInformationModel
                    .toListUngDung()
                    .map(
                      (row) => WidgetRowItemMobile(
                        row: row,
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        )
      ],
    );
  }
}
