import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:ccvc_mobile/widgets/dropdown/drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDropDown extends StatefulWidget {
  String? value;
  List<String> items = [];
  final Function(int)? onSelectItem;
  final Widget? hint;

  CustomDropDown({
    Key? key,
    this.value,
    required this.items,
    this.onSelectItem,
    this.hint,
  }) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: borderColor,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 24,
                    top: 2,
                    bottom: 2,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (widget.items.isEmpty)
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.value ?? '',
                            style: tokenDetailAmount(
                              fontSize: 14.0.textScale(),
                              color: titleColor,
                            ),
                          ),
                        )
                      else
                        DropdownButtonWidget<String>(
                          underline: Container(),
                          isExpanded: true,
                          value: widget.value,
                          hint: widget.hint ?? Text(S.current.select_validate),
                          icon: Container(),
                          focusColor: statusCalenderRed,
                          onChanged: (value) {
                            if (widget.items.isNotEmpty &&
                                widget.items.first !=
                                    S.current.danh_sach_rong) {
                              setState(() {
                                widget.value = value;
                              });
                              final index = widget.items.indexOf(value ?? '');
                              widget.onSelectItem!(index);
                            }
                          },
                          items: widget.items.isNotEmpty
                              ? widget.items
                                  .map<DropdownMenuItemWidget<String>>(
                                      (String value) {
                                  return DropdownMenuItemWidget(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: tokenDetailAmount(
                                        fontSize: 14.0.textScale(),
                                        color: titleColor,
                                      ),
                                    ),
                                  );
                                }).toList()
                              : [
                                  DropdownMenuItemWidget(
                                      value: S.current.danh_sach_rong,
                                      child: Text(
                                        S.current.danh_sach_rong,
                                        style: tokenDetailAmount(
                                          fontSize: 14.0.textScale(),
                                          color: titleColor,
                                        ),
                                      ))
                                ],
                        ),
                    ],
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 20,
                  child: SvgPicture.asset(
                    ImageAssets.icEditInfor,
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