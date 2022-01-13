import 'package:ccvc_mobile/domain/model/widget_manage/widget_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/fake_data.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_item.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_provider.dart';

import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/widgets/container_backgroud_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_info_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/dialog_setting_widget.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/enum_ext.dart';
import 'package:flutter/material.dart';

class CalendarWorkWidget extends StatefulWidget {
  final WidgetType homeItemType;
  const CalendarWorkWidget({Key? key, required this.homeItemType})
      : super(key: key);

  @override
  State<CalendarWorkWidget> createState() => _CalendarWorkWidgetState();
}

class _CalendarWorkWidgetState extends State<CalendarWorkWidget> {
  @override
  Widget build(BuildContext context) {
    return ContainerBackgroundWidget(
      title: S.current.calendar_work,
      spacingTitle: 0,
      onTapIcon: () {
        HomeProvider.of(context).homeCubit.showDialog(widget.homeItemType);
      },
      dialogSelect: StreamBuilder<WidgetType?>(
        stream: HomeProvider.of(context).homeCubit.showDialogSetting,
        builder: (context, snapshot) {
          return DialogSettingWidget(
            listSelectKey: [
              DialogData(
                title: S.current.calendar_work,
                key: [
                  SelectKey.TAT_CA,
                  SelectKey.LICH_CUA_TOI,
                  SelectKey.LICH_DUOC_MOI,
                ],
              ),
              DialogData(
                title: S.current.time,
                key: [
                  SelectKey.HOM_NAY,
                  SelectKey.TUAN_NAY,
                  SelectKey.THANG_NAY,
                  SelectKey.NAM_NAY
                ],
              )
            ],
            type: widget.homeItemType,
          );
        },
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
