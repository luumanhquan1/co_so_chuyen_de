

class CCVCMenuItemSchedule {
  late String key;
  late String menuTitle;
  late int badgeNumber;

  CCVCMenuItemSchedule(this.key, this.menuTitle, this.badgeNumber);

  String iconAsset() {
    return 'assets/images/' + key + '.svg';
  }
}