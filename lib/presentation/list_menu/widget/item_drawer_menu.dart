import 'package:ccvc_mobile/domain/model/menu_item_schedule.dart';
import 'package:flutter/material.dart';


class ItemDrawerMenu extends StatelessWidget {
  const ItemDrawerMenu({required this.menuItem});

  final CCVCMenuItemSchedule menuItem;

  // const ItemDrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? titleStyle =
    Theme
        .of(context)
        .textTheme
        .headline4
        ?.copyWith(fontSize: 16);
    return Container(
      height: 56,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(219, 223, 239, 0.1),
        border: Border.all(
          color: const Color.fromRGBO(219, 223, 239, 0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
              height: 32, width: 32, child: Image.asset(menuItem.iconAsset())),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Text(
              menuItem.key,
              style: titleStyle,
            ),
          ),
          badge(menuItem.badgeNumber, context),
        ],
      ),
    );
  }

  Widget badge(int badgeNumber, BuildContext context) {
    if (badgeNumber > 0) {
      return Container(
        padding: const EdgeInsets.only(left: 5, right: 5),
        height: 30,
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            menuItem.badgeNumber.toString(),
            style: Theme
                .of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: Colors.white, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}


