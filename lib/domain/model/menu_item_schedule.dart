class MenuItemSchedule {
  final String key;
  final String menuTitle;
  final int badgeNumber;
  List<ChildrenMenuItem> children;

  MenuItemSchedule(
      {required this.key,
      required this.menuTitle,
      required this.badgeNumber,
      required this.children});

  String iconAsset() {
    return 'assets/images/' + key + '.svg';
  }
}

class ChildrenMenuItem {
  final bool isSelected;
  final String title;
  final int number;
  List<ChildrenMenuItem> children;

  ChildrenMenuItem(
    this.isSelected,
    this.title,
    this.number,
    this.children,
  );
}
