import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WidgetChooseDayWeekMonth extends StatelessWidget {
  final Function createMeeting;
  final Function onTapDay;
  final Function onTapWeek;
  final Function onTapMonth;

  const WidgetChooseDayWeekMonth(
      {Key? key,
      required this.createMeeting,
      required this.onTapDay,
      required this.onTapWeek,
      required this.onTapMonth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      child: Row(
        children: [
          Flexible(
            child: GestureDetector(
              onTap: () {
                createMeeting();
              },
              child: SvgPicture.asset(ImageAssets.icAddCaledarScheduleMeet),
            ),
          ),
          Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: backgroundRowColor,
                ),
                child: Row(
            children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: backgroundRowColor,
                  ),
                )
            ],
          ),
              ))
        ],
      ),
    );
  }
}
