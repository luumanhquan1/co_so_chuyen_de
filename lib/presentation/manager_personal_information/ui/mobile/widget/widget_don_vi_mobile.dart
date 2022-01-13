import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/bloc/manager_personal_information_cubit.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/ui/mobile/widget/widget_row_item_mobile.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class WidgetDonVibMobile extends StatefulWidget {
  const WidgetDonVibMobile({Key? key}) : super(key: key);

  @override
  _WidgetDonVibMobileState createState() => _WidgetDonVibMobileState();
}

class _WidgetDonVibMobileState extends State<WidgetDonVibMobile> {
  final ManagerPersonalInformationCubit _cubit =
      ManagerPersonalInformationCubit();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.don_vi,
          style: titleAppbar(fontSize: 14.0.textScale()),
        ),
        spaceH16,
        Container(
          padding: const EdgeInsets.only(top: 6, left: 16),
          decoration: BoxDecoration(
            color: borderItemCalender.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: borderItemCalender),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  children: _cubit.managerPersonalInformationModel
                      .toListDonVi()
                      .map(
                        (row) => WidgetRowItemMobile(
                          row: row,
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
