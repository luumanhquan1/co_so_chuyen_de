import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:ccvc_mobile/widgets/show_buttom_sheet/show_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectDate extends StatefulWidget {
  final String? value;
  final Function(DateTime) onSelectDate;
  final String? hintText;
  final Color? backgroundColor;
  final Widget? leadingIcon;
  final bool isObligatory;
  final double? paddings;


  const SelectDate({
    Key? key,
    this.value,
    required this.onSelectDate,
    this.hintText,
    this.backgroundColor,
    this.leadingIcon,
    this.paddings,
    this.isObligatory = false,
  }) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<SelectDate> {
  String dateSelect = '';

  @override
  void didUpdateWidget(covariant SelectDate oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    dateSelect = widget.value ?? DateTime.now().toString();
  }

  @override
  void initState() {
    if (!widget.isObligatory) {
      dateSelect = widget.value ?? DateTime.now().toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: widget.isObligatory
                  ? borderColor.withOpacity(0.3)
                  : widget.backgroundColor ?? Colors.transparent,
              border: Border.all(
                color: borderColor,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 14,
                        bottom: 14,
                        left: 10,
                      ),
                      child: widget.value == null
                          ? Text(
                              widget.hintText ?? S.current.vuiLongChon,
                              style: tokenDetailAmount(
                                fontSize: 14.0.textScale(),
                                color: titleColor,
                              ),
                            )
                          : Text(
                              widget.isObligatory
                                  ? '${widget.value}'
                                  : DateTime.parse(dateSelect)
                                      .toStringWithListFormat,
                              style: tokenDetailAmount(
                                fontSize: 14.0.textScale(),
                                color: titleColor,
                              ),
                            ),
                    )
                  ],
                ),
                Positioned(
                  right: widget.paddings ?? 3,
                  height: 44,
                  child: GestureDetector(
                    onTap: () {
                      showBottomSheetCustom(
                        context,
                        title: S.current.bao_cao_ket_qua,
                        child: Container(
                          height: 50,
                          color: Colors.black,
                        ),
                      );
                    },
                    child: Center(
                      child: widget.leadingIcon ?? const SizedBox(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
