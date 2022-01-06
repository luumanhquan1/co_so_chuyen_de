import 'package:ccvc_mobile/domain/model/menu_item_schedule.dart';
import 'package:ccvc_mobile/presentation/list_menu/widget/item_drawer_menu.dart';
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
                color: Colors.black12,
                child: SlideTransition(
                  position: widget.offsetAnimation,
                  child: Scaffold(
                    backgroundColor: const Color(0xff333333),
                    appBar: AppBar(
                      // shadowColor: Color(0xff333333),
                      title: Text(
                        widget.title,
                        style: const TextStyle(fontSize: 14),
                      ),
                      backgroundColor: const Color(0xff333333),
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
                      child: StreamBuilder<List<CCVCMenuItemSchedule>>(
                        // stream: widget._viewModel.menuItemStream,
                        initialData: List.empty(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<CCVCMenuItemSchedule>>
                                snapShot) {
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
                                  // child: ItemDrawerMenu(
                                  //   menuItem: widget
                                  //       ._viewModel.listMenuLocal[index],
                                  // ),
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
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                child: Container(color: Colors.black12),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              flex: 3,
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
