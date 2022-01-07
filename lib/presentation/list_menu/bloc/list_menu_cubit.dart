import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/menu_item_schedule.dart';
import 'package:ccvc_mobile/presentation/list_menu/bloc/list_menu_state.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';

class ListMenuCubit extends BaseCubit<ListMenuState> {
  ListMenuCubit() : super(ListMenuInitial());


  List<String> img = [
    ImageAssets.icTongSoLichLamviec,
    ImageAssets.icLichCongTacTrongNuoc,
    ImageAssets.icTongSoLichLamviec,
    ImageAssets.icLichCongTacTrongNuoc,
    ImageAssets.icTongSoLichLamviec,
  ];

  List<MenuItemSchedule> menuItems = [
    MenuItemSchedule(key: 'abc', menuTitle: "họp", badgeNumber: 20,children: [ChildrenMenuItem(isSelected: true, title: 'ok', number: 2)]),
    MenuItemSchedule(key: 'abc', menuTitle: "họp", badgeNumber: 20,children: [ChildrenMenuItem(isSelected: true, title: 'ok', number: 2)]),
    MenuItemSchedule(key: 'abc', menuTitle: "họp", badgeNumber: 20,children: [ChildrenMenuItem(isSelected: true, title: 'ok', number: 2)]),
    MenuItemSchedule(key: 'abc', menuTitle: "họp", badgeNumber: 20,children: [ChildrenMenuItem(isSelected: true, title: 'ok', number: 2)]),
    MenuItemSchedule(key: 'abc', menuTitle: "họp", badgeNumber: 20,children: [ChildrenMenuItem(isSelected: true, title: 'ok', number: 2)]),
  ];

  List<MenuItemSchedule> fakeDataMenu() {

    return [];
  }
}
