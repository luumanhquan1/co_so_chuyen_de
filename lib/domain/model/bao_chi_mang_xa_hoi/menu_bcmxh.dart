class MenuModel{
  List<ListMenuItemModel>?listData;
  MenuModel({this.listData});
}
class ListMenuItemModel{
  String? id;
  String? title;
  List<MenuItemModel>?subMenu;
  ListMenuItemModel({this.id,this.title,this.subMenu});
}
class MenuItemModel{
  String? id;
  String? nodeId;
  String? title;
  MenuItemModel({this.id,this.nodeId,this.title});
}