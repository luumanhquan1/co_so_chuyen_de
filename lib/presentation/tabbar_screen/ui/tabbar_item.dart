import 'package:ccvc_mobile/config/themes/app_theme.dart';
import 'package:ccvc_mobile/generated/l10n.dart';

import 'package:ccvc_mobile/utils/constants/image_asset.dart';

import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:ccvc_mobile/widgets/notify/notify_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum TabBarType { home, report, calendarWork, internalInteraction, menu }

List<TabBarType> getTabListItem() {
  return [
    TabBarType.home,
    TabBarType.report,
    TabBarType.calendarWork,
    TabBarType.internalInteraction,
    TabBarType.menu,
  ];
}

class TabBarItem {
  Widget icon;
  String text;
  TabBarItem({required this.icon, required this.text});
}

extension TabbarEnum on TabBarType {
  int get index {
    switch (this) {
      case TabBarType.home:
        return 0;
      case TabBarType.report:
        return 1;
      case TabBarType.calendarWork:
        return 2;
      case TabBarType.internalInteraction:
        return 3;
      case TabBarType.menu:
        return 4;
      default:
        return 1;
    }
  }

  Widget getScreen() {
    switch (this) {
      case TabBarType.home:
        return Scaffold(backgroundColor: Colors.red,);
      case TabBarType.report:
        return  Scaffold(backgroundColor: Colors.yellow,);
      case TabBarType.calendarWork:
        return  Scaffold(backgroundColor: Colors.red,);
      case TabBarType.internalInteraction:
        return Scaffold(
          backgroundColor: Colors.cyanAccent,
        );
      case TabBarType.menu:
        return  Scaffold(backgroundColor: Colors.blue,);
    }
  }

  TabBarItem getTabBarItem({bool isSelect = false}) {
    switch (this) {
      case TabBarType.home:
        return TabBarItem(
          icon: SvgPicture.asset(
            ImageAssets.icHomeFocus,
            color: isSelect
                ? AppTheme.getInstance().colorField()
                : AppTheme.getInstance().buttonUnfocus(),
            height: 16.0.textScale(),
          ),
          text: "Home",
        );
      case TabBarType.report:
        return TabBarItem(
          icon: SvgPicture.asset(
            ImageAssets.icChartFocus,
            color: isSelect
                ? AppTheme.getInstance().colorField()
                : AppTheme.getInstance().buttonUnfocus(),
            height: 16.0.textScale(),
          ),
          text: "Báo cáo",
        );
      case TabBarType.calendarWork:
        return TabBarItem(
          icon: SvgPicture.asset(
            ImageAssets.icCalendarFocus,
            height: 16.0.textScale(),
            color: isSelect
                ? AppTheme.getInstance().colorField()
                : AppTheme.getInstance().buttonUnfocus(),
          ),
          text: "Lịch làm việc",
        );
      case TabBarType.internalInteraction:
        return TabBarItem(
          icon: SvgPicture.asset(
            ImageAssets.icMessageFocus,
            height: 16.0.textScale(),
            color: isSelect
                ? AppTheme.getInstance().colorField()
                : AppTheme.getInstance().buttonUnfocus(),
          ),
          text:"Tương tác nội bộ",
        );
      case TabBarType.menu:
        return TabBarItem(
          icon: SvgPicture.asset(
            ImageAssets.icMenuFocus,
            height: 16.0.textScale(),
            color: isSelect
                ? AppTheme.getInstance().colorField()
                : AppTheme.getInstance().buttonUnfocus(),
          ),
          text: "Menu",
        );
    }
  }
}

class TabScreen {
  Widget widget;
  TabBarType type;

  TabScreen({required this.widget, required this.type});
}
