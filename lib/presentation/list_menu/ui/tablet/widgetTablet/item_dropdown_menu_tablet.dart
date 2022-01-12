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
  final int index;

  ItemDropDownMenuTablet(
      {Key? key,
      required this.title,
      required this.image,
      required this.cubit,
      required this.index})
      : super(key: key);da

  @override
  State createState() {
    return ItemDropDownMenuTabletState();
  }
}

class ItemDropDownMenuTabletState extends State<ItemDropDownMenuTablet> {
  @override
  Widget build(BuildContext context) {
    if (widget.cubit.menuItems[widget.index].badgeNumber != 0) {
      //number
      return Container(
        margin: const EdgeInsets.only(left: 27, right: 29, bottom: 24),
        decoration: BoxDecoration(
          border: Border.all(color: cellColorborder),
          color: cellColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 12, bottom: 12, top: 12),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [
                SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset(widget.image)),
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
                // const SizedBox(
                //   width: 16,
                // )
              ],
            ),
          ),
        ),
      );
    } else {
      // dropdown
      return ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: iconColorDown,
          useInkWell: true,
        ),
        child: ExpandableNotifier(
          child: Container(
            margin: const EdgeInsets.only(left: 27, right: 30, bottom: 24),
            child: Column(
              children: <Widget>[
                ScrollOnExpand(
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: false,
                    ),
                    header: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: cellColorborder),
                        color: cellColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(widget.image),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            widget.title,
                            style: textNormalCustom(
                              fontSize: 14.0.textScale(),
                            ).copyWith(
                                color: fontColorTablet2, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    collapsed: Container(
                      color: Colors.red,
                    ),
                    expanded: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          widget.cubit.menuItems[widget.index].children.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.only(left: 45),
                          margin: const EdgeInsets.only(top: 16),
                          decoration: BoxDecoration(
                            color: cellColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: ListTile(
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
                                  Radius.circular(4),
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
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        );
                      },
                    ),
                    builder: (_, collapsed, expanded) {
                      return Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        // theme: const ExpandableThemeData(crossFadePoint: 0),
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
