import 'dart:typed_data';

import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/data/helper/firebase/firebase_authentication.dart';
import 'package:ccvc_mobile/presentation/sign_up/bloc/sign_up_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';

class SignUpCubit extends BaseCubit<SignUpState> {
  SignUpCubit() : super(SignUpStateIntial());

  bool isHideClearData = false;
  bool isCheckEye1 = true;
  bool isCheckEyeXacNhan = true;
  bool isHideEyeXacNhan = false;
  bool isHideEye1 = false;
  bool passIsError = false;

  BehaviorSubject<DateTime> birthDaySubject = BehaviorSubject();

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

  Future<Uint8List?> pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    final XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return _file.readAsBytes();
    }
  }
}
