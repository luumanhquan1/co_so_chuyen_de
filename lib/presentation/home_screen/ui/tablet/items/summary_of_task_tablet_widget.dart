import 'package:ccvc_mobile/domain/model/dashboard_schedule.dart';
import 'package:ccvc_mobile/domain/model/home/calendar_metting_model.dart';
import 'package:ccvc_mobile/domain/model/widget_manage/widget_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/bloc/home_cubit.dart';
import 'package:ccvc_mobile/presentation/home_screen/fake_data.dart';

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
  final TongHopNhiemVuCubit _nhiemVuCubit = TongHopNhiemVuCubit();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    cubit = HomeProvider.of(context).homeCubit;
    _nhiemVuCubit.getDataTongHopNhiemVu();
  }

  @override
  Widget build(BuildContext context) {
    return ContainerBackgroundTabletWidget(
      maxHeight: 858,
      title: S.current.summary_of_tasks,
      onTapIcon: () {
        HomeProvider.of(context).homeCubit.showDialog(widget.homeItemType);
      },
      isUnit: true,
      selectKeyDialog: _nhiemVuCubit,
      dialogSelect: DialogSettingWidget(
        type: widget.homeItemType,
        listSelectKey: [
          DialogData(
            onSelect: (value) {
              _nhiemVuCubit.selectDonVi(
                  selectKey: value,
                  );
            },
            title: S.current.nhiem_vu,
            key: [
              SelectKey.CA_NHAN,
              SelectKey.DON_VI,
            ],
          ),
          DialogData(
            onSelect: (value) {
              _nhiemVuCubit.selectDate(
                  selectKey: value,
                  startDate: DateTime.now(),
                  endDate: DateTime.now());
            },
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
              stream: _nhiemVuCubit.getTonghopNhiemVu,
              builder: (context, snapshot) {
                final data = snapshot.data ?? <DashboardSchedule>[];
                return GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(data.length, (index) {
                    final img = FakeData.img[index];
                    final result = data[index];
                    return Container(
                      color: Colors.red,
                    );
                  }),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
