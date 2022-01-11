import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/images.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/ui/items/flutter_switch_widget.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/ui/items/manager_personal_information_row.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WidgetRowItem extends StatefulWidget {
  final ManagerPersonalInformationRow row;

  const WidgetRowItem({Key? key, required this.row}) : super(key: key);

  @override
  State<WidgetRowItem> createState() => _WidgetRowItemState();
}

class _WidgetRowItemState extends State<WidgetRowItem> {
  @override
  Widget build(BuildContext context) {
    final bool isContainer = widget.row.type == TypeRow.status;
    return Column(
      children: [
        spaceH24,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Text(
                widget.row.title,
                style: tokenDetailAmount(
                  fontSize: 14.0.textScale(),
                  color: titleItemEdit,
                ),
              ),
            ),
            Expanded(
                flex: 6,
                child: widget.row.type == TypeRow.text
                    ? Text(
                        '${widget.row.value}',
                        style: tokenDetailAmount(
                          fontSize: 14.0.textScale(),
                          color: titleCalenderWork,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isContainer)
                            Container(
                              decoration: const BoxDecoration(
                                color: daXuLyColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              child: Container(
                                margin: const EdgeInsets.only(
                                  left: 6,
                                  right: 6,
                                  top: 2,
                                  bottom: 2,
                                ),
                                child: Text(
                                  widget.row.value,
                                  style: tokenDetailAmount(
                                    fontSize: 10.0.textScale(),
                                    color: backgroundColorApp,
                                  ),
                                ),
                              ),
                            )
                          else
                            customSwitch(widget.row.value, (value) {})
                        ],
                      ))
          ],
        )
      ],
    );
  }

  Widget customSwitch(bool value, Function(bool) onToggle) {
    return FlutterSwitchWidget(
      height: 24,
      width: 42,
      toggleSize: 14,
      inactiveIcon: SvgPicture.asset('$baseImg/ic_x.svg'),
      activeIcon: SvgPicture.asset('$baseImg/ic_v.svg'),
      inactiveColor: const Color(0xffDBDFEF),
      activeColor: const Color(0xffDB353A),
      value: value,
      onToggle: onToggle,
    );
  }
}
