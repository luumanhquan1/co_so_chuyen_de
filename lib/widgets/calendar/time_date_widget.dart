import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TimeDateInputWidget extends StatefulWidget {
  const TimeDateInputWidget({Key? key}) : super(key: key);

  @override
  _TimeDateInputWidgetState createState() => _TimeDateInputWidgetState();
}

class _TimeDateInputWidgetState extends State<TimeDateInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: const BorderRadius.all(Radius.circular(6))),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TimeDatePickerWidget(),
          SvgPicture.asset(ImageAssets.icClock)
        ],
      ),
    );
  }
}

class TimeDatePickerWidget extends StatelessWidget {
  final FocusNode timeFocus;
  final FocusNode minuetFocus;
  const TimeDatePickerWidget(
      {Key? key, required this.minuetFocus, required this.timeFocus})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 35,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 50,
            width: 20,
            child: Center(
                child: Stack(
              children: [
                TimeTextFieldWidget(focusNode: timeFocus,),
                buildPicker(),
              ],
            )),
          ),
          Text(
            ':',
            style: textNormal(titleColor, 14),
          ),
          SizedBox(
            height: 50,
            width: 20,
            child: Center(
                child: Stack(
              children: [
                TimeTextFieldWidget(focusNode: ,),
                buildPicker(),
              ],
            )),
          ),
        ],
      ),
    );
  }

  Widget buildPicker() {
    const double kItemExtent = 20.0;

    const double kMagnification = 1.02;
    const double kSqueeze = 1;

    return CupertinoPicker(
      itemExtent: kItemExtent,
      magnification: kMagnification,
      backgroundColor: Colors.transparent,
      diameterRatio: 3,
      selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
        background: Colors.transparent,
      ),
      onSelectedItemChanged: (value) {},
      squeeze: kSqueeze,
      looping: true,
      children: List.generate(
        24,
        (index) => SizedBox(
          width: 100,
          child: Align(
            child: Text(
              index < 10 ? '0$index' : '$index',
              style: textNormal(titleColor, 15),
            ),
          ),
        ),
      ),
    );
  }
}

class TimeTextFieldWidget extends StatelessWidget {
  final FocusNode focusNode;
  const TimeTextFieldWidget({Key? key, required this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      style: textNormal(titleColor, 15),
      keyboardType: TextInputType.number,
      decoration:
          const InputDecoration(border: InputBorder.none, isDense: true),
    );
  }
}
