import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/config/themes/app_theme.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_item.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/home_screen.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/widgets/container_backgroud_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/dialog_setting_widget.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class EventOfDayWidget extends StatefulWidget {
  final HomeItemType homeItemType;
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
        children: [
          Column(
            children: List.generate(
              10,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: infoWidget(),
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(ImageAssets.icSinhNhat),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        S.current.birthday,
                        style: textNormalCustom(
                          color: AppTheme.getInstance().titleColor(),
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  SvgPicture.asset(ImageAssets.icNext)
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Column(
                children: List.generate(
                  10,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: infoWidget(),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget infoWidget() {
    return Row(
      children: [
        Container(
          height: 8,
          width: 8,
          decoration: const BoxDecoration(
            color: Color(0xffD4DAE3),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(
          width: 14,
        ),
        Expanded(
          child: Text(
            'Đẩy mạnh tuyên truyền những mô hình hay, cách làm tốt trong thực hiện "mục tiêu kép"',
            style: textNormal(infoColor, 14),
          ),
        )
      ],
    );
  }
}
