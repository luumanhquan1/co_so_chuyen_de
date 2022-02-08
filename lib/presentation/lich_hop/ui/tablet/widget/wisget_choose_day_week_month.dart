import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/lich_hop/bloc/lich_hop_cubit.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WidgetChooseDayWeekMonth extends StatefulWidget {
  final Function createMeeting;
  final Function onTapDay;
  final Function onTapWeek;
  final Function onTapMonth;

  const WidgetChooseDayWeekMonth({
    Key? key,
    required this.createMeeting,
    required this.onTapDay,
    required this.onTapWeek,
    required this.onTapMonth,
  }) : super(key: key);

  @override
  State<WidgetChooseDayWeekMonth> createState() =>
      _WidgetChooseDayWeekMonthState();
}

class _WidgetChooseDayWeekMonthState extends State<WidgetChooseDayWeekMonth> {
  final LichHopCubit cubit = LichHopCubit();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      height: 48.0,
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  widget.createMeeting();
                },
                child: SvgPicture.asset(ImageAssets.icAddCaledarScheduleMeet),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: backgroundRowColor,
              ),
              child: Center(
                child: StreamBuilder<int>(
                  stream: cubit.index.stream,
                  builder: (context, snapshot) {
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                cubit.index.sink.add(0);
                                widget.onTapDay();
                              },
                              child: Container(
                                height: 36,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: cubit.index.value == 0
                                      ? buttonColor
                                      : backgroundRowColor,
                                ),
                                child: Center(
                                  child: Text(
                                    S.current.ngay,
                                    style: textNormalCustom(
                                      fontSize: 16.0,
                                      color: cubit.index.value == 0
                                          ? backgroundColorApp
                                          : titleColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: cubit.index.value == 2
                                ? borderItemCalender
                                : backgroundRowColor,
                            width: 1.0,
                            height: 48,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                cubit.index.sink.add(1);
                                widget.onTapWeek();
                              },
                              child: Container(
                                height: 36,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: cubit.index.value == 1
                                      ? buttonColor
                                      : backgroundRowColor,
                                ),
                                child: Center(
                                  child: Text(
                                    S.current.tuan,
                                    style: textNormalCustom(
                                      fontSize: 16.0,
                                      color: cubit.index.value == 1
                                          ? backgroundColorApp
                                          : titleColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: cubit.index.value == 0
                                ? borderItemCalender
                                : backgroundRowColor,
                            width: 1.0,
                            height: 48,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                cubit.index.sink.add(2);
                                widget.onTapMonth();
                              },
                              child: Container(
                                height: 36,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: cubit.index.value == 2
                                      ? buttonColor
                                      : backgroundRowColor,
                                ),
                                child: Center(
                                  child: Text(
                                    S.current.thang,
                                    style: textNormalCustom(
                                      fontSize: 16.0,
                                      color: cubit.index.value == 2
                                          ? backgroundColorApp
                                          : titleColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 180,
                decoration: BoxDecoration(
                  color: backgroundColorApp,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: toDayColor),
                  boxShadow: [
                    BoxShadow(
                      color: shadowContainerColor.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(ImageAssets.icSeachTablet),
                    ),
                    border: InputBorder.none,
                    hintText: S.current.tim_kiem,
                    hintStyle: textNormalCustom(
                      color: textBodyTime,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0.textScale(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}