import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/domain/model/menu_item_schedule.dart';
import 'package:ccvc_mobile/presentation/list_menu/bloc/list_menu_cubit.dart';
import 'package:ccvc_mobile/presentation/list_menu/widget/item_drawer_menu.dart';
import 'package:ccvc_mobile/presentation/list_menu/widget/item_expandable_menu.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ModelMenuCCVC extends StatefulWidget {
  final Animation<Offset> offsetAnimation;
  final String title;
  final String image;

  // const ModelMenuCCVC({Key? key}) : super(key: key);
  const ModelMenuCCVC(this.offsetAnimation, this.title,this.image);

  @override
  _ModelMenuCCVCState createState() => _ModelMenuCCVCState();
}

class _ModelMenuCCVCState extends State<ModelMenuCCVC> {
  late ListMenuCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = ListMenuCubit();
  }

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
                      title: Text(
                        widget.title,
                        style: const TextStyle(fontSize: 14), 
                      ),
                      backgroundColor: backgroundDrawerMenu,
                      leading: Builder(
                        builder: (BuildContext context) {
                          return IconButton(
                            icon: SvgPicture.asset(widget.image),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                    body: SafeArea(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _cubit.menuItems.length,
                        itemBuilder: (context, index) {
                          // return ItemDrawerMenu(
                          //   menuItem: _cubit.fakeDataMenu()[index],
                          // );
                          return ItemExpandableMenu(image: _cubit.img[index],title: _cubit.menuItems[index].menuTitle, cubit: _cubit,);
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
