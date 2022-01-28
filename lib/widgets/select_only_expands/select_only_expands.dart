

import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';

import 'package:ccvc_mobile/widgets/select_only_expands/expand_only_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rxdart/rxdart.dart';

class SelectOnlyExpand extends StatefulWidget {
  final bool initExpand;
  final List<String> listSelect;
  final String value;
  final String title;
  final String urlIcon;
  final bool isShowValue;
  final Widget? customValue;
  const SelectOnlyExpand({
    Key? key,
    this.initExpand = false,
    this.listSelect = const [],
    this.value = '',
    this.isShowValue = true,
    this.title = '',
    required this.urlIcon,
    this.customValue,
  }) : super(key: key);

  @override
  _ExpandedSectionState createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<SelectOnlyExpand>
    with SingleTickerProviderStateMixin {
  final BehaviorSubject<int> selectBloc = BehaviorSubject<int>();
  String valueSelect = '';
   AnimationController? expandController;
  @override
  void initState() {
    super.initState();
    if (widget.listSelect.isNotEmpty) {
      final data =
          widget.listSelect.where((element) => element == widget.value);
      if (data.isNotEmpty) {
        valueSelect = data.first;
      }
    }
  }
  @override
  void dispose() {
    selectBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandOnlyWidget(
      initExpand: widget.initExpand,
      isShowIcon: false,
      initController: (value){
        expandController = value;
      },
      header: headerWidget(),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          widget.listSelect.length,
              (index) => Padding(
            padding: EdgeInsets.only(left: 28, top: index == 0 ? 0 : 8),
            child: GestureDetector(
              onTap: () {
                valueSelect = widget.listSelect[index];
                selectBloc.sink.add(index);
              },
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.listSelect[index],
                      style: textNormal(titleColor, 16),
                    ),
                    if (widget.isShowValue)
                      StreamBuilder<int>(
                        stream: selectBloc.stream,
                        builder: (context, snapshot) {
                          final data = snapshot.data ?? 0;
                          return data == index
                              ? Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child:
                            SvgPicture.asset(ImageAssets.icCheck),
                          )
                              : const SizedBox();
                        },
                      )
                    else
                      const SizedBox()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget headerWidget() {
    return Row(
      children: [
        SvgPicture.asset(
          widget.urlIcon,
          width: 16,
          height: 16,
        ),
        const SizedBox(
          width: 14,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 9),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  // color: expandController.value == 0
                    color: lineColor
                  //     : Colors.transparent,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: textNormal(titleColumn, 16),
                  ),
                ),
                Expanded(
                  child: widget.customValue ??
                      StreamBuilder<int>(
                        stream: selectBloc.stream,
                        builder: (context, snapshot) {
                          return Text(
                            valueSelect,
                            style: textNormal(titleColor, 16),
                            overflow: TextOverflow.ellipsis,
                          );
                        },
                      ),
                ),
                // AnimatedBuilder(
                //   animation: expandController,
                //   builder: (context, _) {
                //     return expandController.value == 0
                //         ? const Icon(
                //       Icons.keyboard_arrow_down_outlined,
                //       color: AqiColor,
                //     )
                //         : const Icon(
                //       Icons.keyboard_arrow_up_rounded,
                //       color: AqiColor,
                //     );
                //   },
                // )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
