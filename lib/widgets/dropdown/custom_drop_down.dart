import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/images.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:ccvc_mobile/widgets/dropdown/drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDropDown extends StatefulWidget {
  String? value;
  List<String> items = [];
  final Function(int)? onSelectItem;
  final Widget? hint;

  CustomDropDown(
      {Key? key, this.value, required this.items, this.onSelectItem, this.hint})
      : super(key: key);

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
                color: const Color(0xffDBDFEF),
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (widget.items.isEmpty)
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.value ?? '',
                            style: tokenDetailAmount(
                              fontSize: 12.0.textScale(),
                              color: titleColor,
                            ),
                          ),
                        )
                      else
                        DropdownButtonWidget<String>(
                          underline: Container(),
                          isExpanded: true,
                          value: widget.value,
                          hint: widget.hint ?? Text('select_validate'),
                          icon: Container(),
                          focusColor: Colors.red,
                          onChanged: (value) {
                            if (widget.items.isNotEmpty &&
                                widget.items.first != 'Danh sách rỗng') {
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
                                        fontSize: 12.0.textScale(),
                                        color: titleColor,
                                      ),
                                    ),
                                  );
                                }).toList()
                              : [
                                  DropdownMenuItemWidget(
                                      value: 'Danh sách rỗng',
                                      child: Text(
                                        'Danh sách rỗng',
                                        style: tokenDetailAmount(
                                          fontSize: 12.0.textScale(),
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
                    '$baseImg/ic_edit_infor.svg',
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
