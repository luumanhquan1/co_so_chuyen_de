import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/config/themes/app_theme.dart';
import 'package:ccvc_mobile/presentation/tabbar_screen/ui/tabbar_item.dart';
import 'package:flutter/material.dart';

class BottomTabBarWidget extends StatelessWidget {
  final int selectItemIndex;
  final Function(TabbarType) onChange;
  const BottomTabBarWidget({
    Key? key,
    required this.selectItemIndex,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listItem = getTabListItem();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: AppTheme.getInstance().dfBtnTxtColor(),
        border: const Border(top: BorderSide(color: fittingBg)),
      ),
      child: SafeArea(
        child: Row(
          children: List.generate(listItem.length, (index) {
            final tab = listItem[index];

            return Expanded(
              child: GestureDetector(
                onTap: () {
                  onChange(tab);
                },
                child: tabBarItem(context, tab, index == selectItemIndex),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget tabBarItem(BuildContext context, TabbarType item,bool isSelect) {
    return Container(
      color: Colors.transparent,
height: 32,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          item.getTabbarItem(isSelect: isSelect).icon,
          FittedBox(
            child: Text(
              item.getTabbarItem().text,
              style: textNormal(
                isSelect ? const Color(0xff7966FF) : const Color(0xffA2AEBD),
                10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
