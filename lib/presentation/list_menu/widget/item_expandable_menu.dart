import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/themes/app_theme.dart';
import 'package:ccvc_mobile/presentation/list_menu/bloc/list_menu_cubit.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemExpandableMenu extends StatefulWidget {
  late String title;
  final String image;
  final ListMenuCubit cubit;

  ItemExpandableMenu(
      {Key? key, required this.title, required this.image, required this.cubit})
      : super(key: key);

  @override
  State createState() {
    return ItemExpandableMenuState();
  }
}

class ItemExpandableMenuState extends State<ItemExpandableMenu> {
  @override
  Widget build(BuildContext context) {
    return ExpandableTheme(
      data: const ExpandableThemeData(
        iconColor: fontColor,
        useInkWell: true,
      ),
      child: ExpandableNotifier(
          child: Column(
        children: <Widget>[
          ScrollOnExpand(
            scrollOnExpand: true,
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
                    style: const TextStyle(color: fontColor),
                  ),
                ],
              ),
              collapsed: const SizedBox(),
              expanded: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      widget.cubit.menuItems[0].children[0].title,
                      style: const TextStyle(color: fontColor),
                    ),
                    trailing: Container(
                      color: buttonColor,
                      height: 15,
                      width: 20,
                      child: Text(
                          widget.cubit.menuItems[0].children[0].number.toString(),
                          style: const TextStyle(color: fontColor)),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
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
      )),
    );
  }
}
