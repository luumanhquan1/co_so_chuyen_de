import 'dart:developer';

import 'package:ccvc_mobile/domain/model/widget_manage/widget_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/bloc/home_cubit.dart';
import 'package:ccvc_mobile/presentation/home_screen/fake_data.dart';

import 'package:ccvc_mobile/presentation/home_screen/ui/home_provider.dart';

import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/widgets/container_backgroud_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_info_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/dialog_setting_widget.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/enum_ext.dart';
import 'package:flutter/material.dart';

class MeetingScheduleWidget extends StatefulWidget {
  final WidgetType homeItemType;
  const MeetingScheduleWidget({Key? key, required this.homeItemType})
      : super(key: key);

  @override
  State<MeetingScheduleWidget> createState() => _MeetingScheduleWidgetState();
}

class _MeetingScheduleWidgetState extends State<MeetingScheduleWidget> {
  final LichHopCubit _lichHopCubit = LichHopCubit();
  @override
  Widget build(BuildContext context) {
    return ContainerBackgroundWidget(
      spacingTitle: 0,
      title: S.current.meeting_schedule,
      selectKeyDialog: _lichHopCubit,
      listSelect: const [
        SelectKey.LICH_HOP_CUA_TOI,
        SelectKey.LICH_HOP_DUOC_MOI,
        SelectKey.LICH_HOP_CAN_DUYET,
      ],
      onTapIcon: () {
        HomeProvider.of(context).homeCubit.showDialog(widget.homeItemType);
      },
      dialogSelect: DialogSettingWidget(
        type: widget.homeItemType,
        listSelectKey: [
          DialogData(
            onSelect: (value,startDate,endDate) {
              _lichHopCubit.selectDate(
                  selectKey: value,
                  startDate: startDate,
                  endDate: endDate);
            },
            title: S.current.time,
          )
        ],
      ),
      child: Column(
        children: List.generate(FakeData.caledar.length, (index) {
          final data = FakeData.caledar[index];
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: ContainerInfoWidget(
              status: data.codeStatus.getText(),
              colorStatus: data.codeStatus.getColor(),
              backGroundStatus: true,
              title: data.title,
              listData: [
                InfoData(
                  urlIcon: ImageAssets.icTime,
                  key: S.current.time,
                  value: data.time,
                ),
                InfoData(
                  urlIcon: ImageAssets.icAddress,
                  key: S.current.dia_diem,
                  value: data.address,
                ),
                InfoData(
                  urlIcon: ImageAssets.icPeople,
                  key: S.current.nguoi_chu_tri,
                  value: data.nguoiChuTri,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
