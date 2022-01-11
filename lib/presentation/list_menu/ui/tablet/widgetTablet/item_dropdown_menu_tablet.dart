import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/presentation/list_menu/bloc/list_menu_cubit.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemDropDownMenuTablet extends StatefulWidget {
  late String title;
  final String image;
  final ListMenuCubit cubit;
  final index;
  dynamic a;

  ItemDropDownMenuTablet(
      {Key? key,
      required this.title,
      required this.image,
      required this.cubit,
      required this.index})
      : super(key: key);

  @override
  State createState() {
    return ItemDropDownMenuTabletState();
  }
}

class ItemDropDownMenuTabletState extends State<ItemDropDownMenuTablet> {
  @override
  Widget build(BuildContext context) {
    if (widget.cubit.menuItems[widget.index].badgeNumber != 0) {
      return Container(
        decoration: BoxDecoration(
          color: cellColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 23),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                SvgPicture.asset(widget.image),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  widget.title,
                  style: textNormalCustom(fontSize: 20.0.textScale())
                      .copyWith(color: fontColorTablet2),
                ),
                const Expanded(child: SizedBox()),
                if (widget.cubit.menuItems[widget.index].badgeNumber == 0)
                  const SizedBox()
                else
                  Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: numberColorTabletbg,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      child: Text(
                        widget.cubit.menuItems[widget.index].badgeNumber
                            .toString(),
                        style: const TextStyle(
                            color: numberColorTablet, fontSize: 14),
                      ),
                    ),
                  ),
                const SizedBox(
                  width: 16,
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: iconColorDown,
          useInkWell: true,
        ),
        child: ExpandableNotifier(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 23),
            child: Column(
              children: <Widget>[
                ScrollOnExpand(
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Row(
                      children: [
                        SvgPicture.asset(widget.image),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          widget.title,
                          style: textNormalCustom(
                            fontSize: 14.0.textScale(),
                          ).copyWith(color: fontColorTablet2, fontSize: 20),
                        ),
                      ],
                    ),
                    collapsed: const SizedBox(),
                    expanded: Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget
                            .cubit.menuItems[widget.index].children.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              widget.cubit.menuItems[widget.index]
                                  .children[index].title,
                              style: textNormalCustom(
                                fontSize: 14.0.textScale(),
                              ).copyWith(color: fontColorTablet2, fontSize: 20),
                            ),
                            trailing: Container(
                              decoration: const BoxDecoration(
                                color: numberColorTabletbg,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2),
                                ),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(4),
                                child: Text(
                                  widget.cubit.menuItems[widget.index]
                                      .children[index].number
                                      .toString(),
                                  style: const TextStyle(
                                      color: numberColorTablet, fontSize: 14),
                                ),
                              ),
                            ),
                            onTap: () {},
                          );
                        },
                      ),
                    ),
                    builder: (_, collapsed, expanded) {
                      return Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
