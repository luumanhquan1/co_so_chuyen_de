import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/domain/model/menu_item_schedule.dart';
import 'package:ccvc_mobile/presentation/list_menu/widget/item_drawer_menu.dart';
import 'package:ccvc_mobile/presentation/list_menu/widget/item_expandable_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ModelMenuCCVC extends StatefulWidget {
  final Animation<Offset> offsetAnimation;
  final String title;

  // const ModelMenuCCVC({Key? key}) : super(key: key);
  const ModelMenuCCVC(this.offsetAnimation, this.title);

  @override
  _ModelMenuCCVCState createState() => _ModelMenuCCVCState();
}

class _ModelMenuCCVCState extends State<ModelMenuCCVC> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                color: backgroundDrawer,
                child: SlideTransition(
                  position: widget.offsetAnimation,
                  child: Scaffold(
                    backgroundColor: backgroundDrawerMenu,
                    appBar: AppBar(
                      // shadowColor: Color(0xff333333),
                      title: Text(
                        widget.title,
                        style: const TextStyle(fontSize: 14),
                      ),
                      backgroundColor: backgroundDrawerMenu,
                      leading: Builder(
                        builder: (BuildContext context) {
                          return IconButton(
                            icon: const Icon(Icons.menu),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                    body: SafeArea(
                      child: StreamBuilder<List<MenuItemSchedule>>(

                        builder: (BuildContext context,
                            AsyncSnapshot<List<MenuItemSchedule>>snapShot) {
                          final items = snapShot.data ?? [];
                          if (items.isNotEmpty) {
                            return ListView.separated(
                              padding: const EdgeInsets.all(16),
                              itemCount: items.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  child: ItemDrawerMenu(
                                    menuItem: items[index],
                                  ),
                                  onTap: () => {
                                    // widget._viewModel
                                    //     .didSelectMenuItem(items[index]),
                                    Navigator.pop(context, items[index].key),
                                  },
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(
                                color: Colors.transparent,
                              ),
                            );
                          } else {
                            return ListView.separated(
                              padding: const EdgeInsets.all(16),
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                // return Container();
                                return GestureDetector(
                                  child: ItemExpandableMenu(title: 'okok'),
                                  onTap: () => {
                                    Navigator.pop(context, items[index].key),
                                  },
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(
                                color: Colors.transparent,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GestureDetector(
                child: Container(color: backgroundDrawer),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}

// Navigator.push(
// context,
// PageRouteBuilder(
// reverseTransitionDuration:
// const Duration(milliseconds: 250),
// transitionDuration: const Duration(milliseconds: 250),
// pageBuilder: (_, animation, ___) {
// const begin = Offset(-1.0, 0.0);
// const end = Offset.zero;
// final tween = Tween(begin: begin, end: end);
// final offsetAnimation = animation.drive(tween);
// return ModelMenuCCVC(offsetAnimation, 'Họp');
// },
// opaque: false,
// ),
// );
