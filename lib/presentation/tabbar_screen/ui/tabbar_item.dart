import 'package:ccvc_mobile/utils/constants/image_asset.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum TabbarType { home, baoCao, lichLamViec, tuongTacNoiBo, menu }
List<TabbarType> getTabListItem() {
  return [
    TabbarType.home,
    TabbarType.baoCao,
    TabbarType.lichLamViec,
    TabbarType.tuongTacNoiBo,
    TabbarType.menu,
  ];
}

class TabBarItem {
  Widget icon;
  String text;
  TabBarItem({required this.icon, required this.text});
}

extension TabbarEnum on TabbarType {
  int get index {
    switch (this) {
      case TabbarType.home:
        return 0;
      case TabbarType.baoCao:
        return 1;
      case TabbarType.lichLamViec:
        return 2;
      case TabbarType.tuongTacNoiBo:
        return 3;
      case TabbarType.menu:
        return 4;

      default:
        return 1;
    }
  }

  Widget getScreen() {
    switch (this) {
      case TabbarType.home:
        return Scaffold(
          backgroundColor: Colors.red,
        );
      case TabbarType.baoCao:
        return Scaffold(
          backgroundColor: Colors.blue,
        );
      case TabbarType.lichLamViec:
        return Scaffold(
          backgroundColor: Colors.yellow,
        );
      case TabbarType.tuongTacNoiBo:
        return Scaffold(
          backgroundColor: Colors.cyanAccent,
        );

      case TabbarType.menu:
        return Scaffold(
          backgroundColor: Colors.pink,
        );
    }
  }

  TabBarItem getTabbarItem({bool isSelect = false}) {
    switch (this) {
      case TabbarType.home:
        return TabBarItem(
          icon: SvgPicture.asset(
              isSelect ? ImageAssets.icHomeFocus : ImageAssets.icHomeUnFocus,height: 16,),
          text: 'Trang chủ',
        );
      case TabbarType.baoCao:
        return TabBarItem(
          icon: SvgPicture.asset(
              isSelect ? ImageAssets.icChartFocus : ImageAssets.icChartUnFocus,height: 16,),
          text: 'Báo cáo',
        );
      case TabbarType.lichLamViec:
        return TabBarItem(
          icon: SvgPicture.asset(isSelect
              ? ImageAssets.icCalendarFocus
              : ImageAssets.icCalendarUnFocus,height: 16,),
          text: 'Lịch làm việc',
        );
      case TabbarType.tuongTacNoiBo:
        return TabBarItem(
          icon: SvgPicture.asset(isSelect
              ? ImageAssets.icMessageFocus
              : ImageAssets.icMessageUnFocus,height: 16,),
          text: 'Tương tác nội bộ',
        );
      case TabbarType.menu:
        return TabBarItem(
          icon: SvgPicture.asset(
              isSelect ? ImageAssets.icMenuFocus : ImageAssets.icMenuUnFocus,height: 16,),
          text: 'Menu',
        );
    }
  }
}

class Tabbar {
  Widget widget;
  TabbarType type;

  Tabbar({required this.widget, required this.type});
}
