import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_item.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_screen.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_backgroud_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_info_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/dialog_setting_widget.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CalendarWorkWidget extends StatefulWidget {
  final HomeItemType homeItemType;
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
      onTapIcon: () {
        HomeProvider.of(context).homeCubit.showDialog(widget.homeItemType);
      },
      dialogSelect: StreamBuilder<HomeItemType?>(
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
          }),
      child: Column(
        children: const [
          ContainerInfoWidget(
            status: 'Chờ xác nhận',
            colorStatus: Color(0xff28C76F),
            backGroundStatus: true,
            title: 'Hội nghị lãnh đạo về việc cải cách chương trình đào tạo',
            listData: [
              InfoData(key: 'Số/ký hiệu', value: 'VPCP-TTĐT'),
              InfoData(
                  key: 'Nơi gửi',
                  value:
                      'Ban ATGT Tiền Giang - tỉnh Tiền 4892 394 8372 9847 2398473298'),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ContainerInfoWidget(
            title: 'Hội nghị lãnh đạo về việc cải cách chương trình đào tạo',
            listData: [
              InfoData(key: 'Số/ký hiệu', value: 'VPCP-TTĐT'),
              InfoData(
                  key: 'Nơi gửi',
                  value:
                      'Ban ATGT Tiền Giang - tỉnh Tiền 4892 394 8372 9847 2398473298'),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ContainerInfoWidget(
            title: 'Hội nghị lãnh đạo về việc cải cách chương trình đào tạo',
            listData: [
              InfoData(key: 'Số/ký hiệu', value: 'VPCP-TTĐT'),
              InfoData(
                  key: 'Nơi gửi',
                  value:
                      'Ban ATGT Tiền Giang - tỉnh Tiền 4892 394 8372 9847 2398473298'),
            ],
          )
        ],
      ),
    );
  }
}
