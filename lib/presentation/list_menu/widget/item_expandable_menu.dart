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
    return Scaffold(
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Colors.black,
          useInkWell: true,
        ),
        child: ExpandableNotifier(
            child: Padding(
              padding: const EdgeInsets.all(10),
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
                      header: Padding(
                          padding: const EdgeInsets.all(19),
                          child: Row(
                            children: [
                              const Icon(Icons.margin),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                widget.title,
                                // style: Theme.of(context).textTheme.body2,
                              ),
                            ],
                          )),
                      collapsed: const SizedBox(),
                      expanded: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            title: const Text('Item 1'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: const Text('Item 2'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      builder: (_, collapsed, expanded) {
                        return Padding(
                          padding:
                          const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          child: Expandable(
                            collapsed: collapsed,
                            expanded: expanded,
                            theme: const ExpandableThemeData(crossFadePoint: 0),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}