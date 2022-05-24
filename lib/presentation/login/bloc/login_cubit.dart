import 'package:ccvc_mobile/config/app_config.dart';
import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/data/helper/firebase/firebase_authentication.dart';
import 'package:ccvc_mobile/domain/model/login/user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit() : super(LoginStateIntial());

  bool isHideClearData = false;
  bool isCheckEye1 = true;
  bool isHideEye1 = false;
  bool passIsError = false;

  Future<User?> lognIn(
    String email,
    String password,
  ) async {
    showLoading();
    final User? user = await FirebaseAuthentication.signInUsingEmailPassword(
      email: email,
      password: password,
    );

    if (user != null) {
      final UserInfoModel dataUser = UserInfoModel(
        userId: user.uid,
        avatarUrl: user.photoURL,
        email: user.email,
        birthday: 0,
        gender: true,
        nameDisplay: user.displayName,
        createAt: 0,
        updateAt: 0,
      );

      idUser = user.uid;
    }
    showContent();
    return user;
  }

  void closeDialog() {
    showContent();
  }
}
