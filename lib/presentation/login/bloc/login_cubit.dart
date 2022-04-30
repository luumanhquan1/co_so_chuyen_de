
import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:flutter/cupertino.dart';

import 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit() : super(LoginStateIntial());

  bool isHideClearData = false;
  bool isCheckEye1 = true;
  bool isHideEye1 = false;
  bool passIsError = false;

  

  void closeDialog() {
    showContent();
  }

}
