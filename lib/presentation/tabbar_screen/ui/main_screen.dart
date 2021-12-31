
import 'package:ccvc_mobile/presentation/tabbar_screen/bloc/main_cubit.dart';
import 'package:ccvc_mobile/presentation/tabbar_screen/ui/tabbar_item.dart';
import 'package:ccvc_mobile/presentation/tabbar_screen/ui/widgets/custom_navigator_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MainTabBarView extends StatefulWidget {
  const MainTabBarView({Key? key}) : super(key: key);


  @override
  _MainTabBarViewState createState() => _MainTabBarViewState();
}

class _MainTabBarViewState extends State<MainTabBarView> {
  final List<Tabbar> _listScreen = [];
 final MainCubit _cubit = MainCubit();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    addScreen(TabbarType.home);
    addScreen(TabbarType.baoCao);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cubit.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<TabbarType>(
      stream: _cubit.selectTabBar,
      builder: (context, snapshot) {
        final type=snapshot.data??TabbarType.home;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body:  IndexedStack(
              index: getIndexListScreen(type),
              children: _listScreen.map((e) => e.widget).toList(),
          )   ,
          bottomNavigationBar: BottomTabBarWidget(selectItemIndex: type.index,
            onChange: (value){
            addScreen(value);
              _cubit.selectTab(value);
          },),
        );
      }
    );
  }
int getIndexListScreen(TabbarType type){
    return _listScreen.indexWhere((element) => element.type.index==type.index);
}
  void addScreen(TabbarType type) {
    if (_listScreen.indexWhere((element) => element.type.index == type.index) ==
        -1) {
      _listScreen.add(
        Tabbar(widget: type.getScreen(), type: type),
      );
    }
  }
}
