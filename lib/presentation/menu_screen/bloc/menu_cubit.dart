import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/user_infomation_model.dart';

import 'package:ccvc_mobile/presentation/menu_screen/bloc/menu_state.dart';
import 'package:ccvc_mobile/presentation/menu_screen/ui/fake_date_menu.dart';
import 'package:rxdart/rxdart.dart';

class MenuCubit extends BaseCubit<MenuState> {
  MenuCubit() : super(MainStateInitial());
  final BehaviorSubject<UserInformationModel> _getInforUser =
      BehaviorSubject<UserInformationModel>();

  Stream<UserInformationModel> get getInforUser => _getInforUser.stream;
  void getUser() {
    _getInforUser.sink.add(FakeData.user);
  }
}
