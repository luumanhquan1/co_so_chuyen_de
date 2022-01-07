import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/themes/app_theme.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ItemExpandableMenu extends StatefulWidget {
  late String title;

  ItemExpandableMenu({Key? key, required this.title}) : super(key: key);

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
                  const Icon(Icons.margin),
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
                    title: const Text(
                      'Item 1',
                      style: TextStyle(color: fontColor),
                    ),
                    trailing: Container(
                      color: buttonColor,
                      height: 15,
                      width: 20,
                      child:
                          const Text('12', style: TextStyle(color: fontColor)),
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
