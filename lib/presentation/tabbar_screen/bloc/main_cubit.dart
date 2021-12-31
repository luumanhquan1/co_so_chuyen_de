import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/presentation/tabbar_screen/bloc/main_state.dart';
import 'package:ccvc_mobile/presentation/tabbar_screen/ui/tabbar_item.dart';
import 'package:rxdart/rxdart.dart';

class MainCubit extends BaseCubit<MainState> {
  MainCubit() : super(MainStateInitial());
  final BehaviorSubject<TabbarType> _selectTabBar =
      BehaviorSubject<TabbarType>.seeded(TabbarType.home);

  Stream<TabbarType> get selectTabBar => _selectTabBar.stream;

  void selectTab(TabbarType tab) {
    _selectTabBar.sink.add(tab);
  }

  void dispose() {
    _selectTabBar.close();
  }
}
