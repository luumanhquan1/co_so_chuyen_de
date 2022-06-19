import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/data/helper/firebase/firebase_authentication.dart';
import 'package:ccvc_mobile/data/helper/firebase/firebase_store.dart';
import 'package:ccvc_mobile/domain/locals/hive_local.dart';
import 'package:ccvc_mobile/domain/locals/prefs_service.dart';
import 'package:ccvc_mobile/domain/model/login/user_info.dart';
import 'package:ccvc_mobile/utils/constants/dafault_env.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ccvc_mobile/domain/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit() : super(LoginStateIntial());

  bool isHideClearData = false;
  bool isCheckEye1 = true;
  bool isHideEye1 = false;
  bool passIsError = false;

  Future<void> saveUser() async {
    final UserInfoModel userInfo =
        await FireStoreMethod.getDataUserInfo(PrefsService.getUserId());

    HiveLocal.saveDataUser(userInfo);
  }

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
      // final UserInfoModel dataUser = UserInfoModel(
      //   userId: user.uid,
      //   avataUrl: user.photoURL,
      //   email: user.email,
      //   birthday: 0,
      //   gender: true,
      //   nameDisplay: user.displayName,
      //   createAt: '',
      //   updateAt: '',
      // );
      //
      // HiveLocal.saveDataUser(dataUser);

    await PrefsService.saveUserId(user.uid);
    await saveUser();
    await UserRepopsitory().updateOnline(userId: user.uid, onlineFlag: true);
    }
    showContent();
    return user;
  }

  void closeDialog() {
    showContent();
  }
}
