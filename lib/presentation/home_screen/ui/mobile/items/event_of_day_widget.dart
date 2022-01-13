
import 'package:ccvc_mobile/domain/model/widget_manage/widget_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/fake_data.dart';

import 'package:ccvc_mobile/presentation/home_screen/ui/home_provider.dart';

import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/widgets/container_backgroud_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/dialog_setting_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/event_widget.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';


class EventOfDayWidget extends StatefulWidget {
  final WidgetType homeItemType;
  const EventOfDayWidget({Key? key, required this.homeItemType})
      : super(key: key);

  @override
  _EventOfDayWidgetState createState() => _EventOfDayWidgetState();
}

class _EventOfDayWidgetState extends State<EventOfDayWidget> {
  @override
  Widget build(BuildContext context) {
    return ContainerBackgroundWidget(
      title: S.current.event_of_day,
      onTapIcon: () {
        HomeProvider.of(context).homeCubit.showDialog(widget.homeItemType);
      },
      dialogSelect: DialogSettingWidget(
        type: widget.homeItemType,
      ),
      urlIcon: ImageAssets.icNext,
      leadingIcon: Image.asset(ImageAssets.icStar),
      child: Column(
        children: List.generate(
          FakeData.suKienTrongNgay.length,
          (index) {
            final data= FakeData.suKienTrongNgay[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child:  EventWidget(
                onTap: () {},
                title: data.name,
              ),
            );
          },
        ),
      ),
    );
  }


}
