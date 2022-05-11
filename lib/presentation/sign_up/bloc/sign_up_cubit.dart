import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/data/helper/firebase/firebase_authentication.dart';
import 'package:ccvc_mobile/presentation/sign_up/bloc/sign_up_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpCubit extends BaseCubit<SignUpState> {
  SignUpCubit() : super(SignUpStateIntial());

  bool isHideClearData = false;
  bool isCheckEye1 = true;
  bool isHideEye1 = false;
  bool passIsError = false;

  Future<User?> signUp(
      String email,
      String password,
      ) async {
    showLoading();
    final User? user = await FirebaseAuthentication.signUp(
      email: email,
      password: password,
    );

    if (user != null) {
    }
    showContent();
    return user;
  }

}
