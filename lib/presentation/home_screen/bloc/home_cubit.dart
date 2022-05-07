import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/presentation/home_screen/bloc/home_state.dart';
import 'package:rxdart/subjects.dart';

class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit() : super(HomeStateInitial());
  final BehaviorSubject<TabBarType> _selectTabBar =
  BehaviorSubject<TabBarType>.seeded(TabBarType.home);

  Stream<TabBarType> get selectTabBar => _selectTabBar.stream;

  void selectTab(TabBarType tab) {
    _selectTabBar.sink.add(tab);
  }

  void dispose() {
    _selectTabBar.close();
  }
}