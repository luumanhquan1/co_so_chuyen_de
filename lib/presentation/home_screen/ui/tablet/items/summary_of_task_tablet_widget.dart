import 'package:ccvc_mobile/domain/model/dashboard_schedule.dart';
import 'package:ccvc_mobile/domain/model/home/calendar_metting_model.dart';
import 'package:ccvc_mobile/domain/model/widget_manage/widget_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/bloc/home_cubit.dart';
import 'package:ccvc_mobile/presentation/home_screen/fake_data.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_item.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_provider.dart';

import 'package:ccvc_mobile/presentation/home_screen/ui/tablet/widgets/container_background_tablet_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/tablet/widgets/scroll_bar_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_info_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/dialog_setting_widget.dart';

import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/enum_ext.dart';
import 'package:ccvc_mobile/widgets/listview/rows_sum_widget.dart';
import 'package:ccvc_mobile/widgets/text/no_data_widget.dart';
import 'package:flutter/material.dart';

class SummaryOfTaskTabletWidget extends StatefulWidget {
  final WidgetType homeItemType;
  const SummaryOfTaskTabletWidget({Key? key, required this.homeItemType})
      : super(key: key);

  @override
  State<SummaryOfTaskTabletWidget> createState() => _SummaryOfTaskWidgetState();
}

class _SummaryOfTaskWidgetState extends State<SummaryOfTaskTabletWidget> {
  late HomeCubit cubit;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    cubit = HomeProvider.of(context).homeCubit;
    cubit.getDataTongHopNhiemVu();
  }

  @override
  Widget build(BuildContext context) {
    return ContainerBackgroundTabletWidget(
      maxHeight: 858,
      title: S.current.summary_of_tasks,
      onTapIcon: () {
        HomeProvider.of(context).homeCubit.showDialog(widget.homeItemType);
      },
      dialogSelect: DialogSettingWidget(
        type: widget.homeItemType,
        listSelectKey: [
          DialogData(
            title: S.current.summary_of_tasks,
            key: [
              SelectKey.TAT_CA,
              SelectKey.DON_VI,
            ],
          ),
          DialogData(
            title: S.current.misson,
            key: [
              SelectKey.CHO_XU_LY,
              SelectKey.DANG_XU_LY,
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
      ),
      padding: EdgeInsets.zero,
      child: Flexible(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            StreamBuilder<List<DashboardSchedule>>(
              stream: cubit.getTonghopNhiemVu,
              builder: (context, snapshot) {
                final data = snapshot.data ?? <DashboardSchedule>[];
                return RowSumInfoWidget(
                  padding: 24,
                  data: List.generate(data.length, (index) {
                    final img = FakeData.img[index];
                    final result = data[index];
                    return DataInfo(
                      title: result.typeName,
                      urlIcon: img,
                      value: result.numberOfCalendars.toString(),
                    );
                  }),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: StreamBuilder<List<CalendarMeetingModel>>(
                  stream: cubit.getNhiemVu,
                  builder: (context, snapshot) {
                    final data = snapshot.data ?? <CalendarMeetingModel>[];
                    if (data.isNotEmpty) {
                      return ScrollBarWidget(
                        children: List.generate(data.length, (index) {
                          final result = data[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: ContainerInfoWidget(
                              status: result.codeStatus.getText(),
                              colorStatus: result.codeStatus.getColor(),
                              title: result.title,
                              listData: [
                                InfoData(
                                  urlIcon: ImageAssets.icWork,
                                    key: S.current.loai_nhiem_vu,
                                    value: result.loaiNhiemVu,),
                                InfoData(
                                 urlIcon: ImageAssets.icCalendar,
                                  key: S.current.han_xu_ly,
                                  value: S.current.han_xu_ly,
                                ),
                              ],
                            ),
                          );
                        }),
                      );
                    }
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 100),
                      child: NodataWidget(),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
