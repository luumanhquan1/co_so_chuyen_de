// class MenuModel{
//   List<ListMenuItemModel>listData;
//   MenuModel({required this.listData});
// }
class ListMenuItemModel{
  String id;
  String title;
  List<MenuItemModel>subMenu;
  ListMenuItemModel({required this.id,required this.title,required this.subMenu});
}
class MenuItemModel{
  String id;
  int nodeId;
  String title;
  MenuItemModel({required this.id,required this.nodeId,required this.title});
}