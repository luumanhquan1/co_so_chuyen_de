import 'dart:typed_data';

import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/data/helper/firebase/firebase_authentication.dart';
import 'package:ccvc_mobile/data/helper/firebase/firebase_store.dart';
import 'package:ccvc_mobile/domain/model/login/user_info.dart';
import 'package:ccvc_mobile/presentation/sign_up/bloc/sign_up_state.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
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
  String gender = 'Nam';
  DateTime birthDay = DateTime(2001, 1, 1);
  UserInfoModel dataUser = UserInfoModel.empty();
  Uint8List? image;

  BehaviorSubject<DateTime> birthDaySubject =
      BehaviorSubject.seeded(DateTime(2001, 1, 1));

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
      dataUser = UserInfoModel(
        userId: user.uid,
        avataUrl: user.photoURL,
        email: user.email,
        birthday: '',
        gender: true,
        nameDisplay: user.displayName,
        createAt: '',
        updateAt: '',
      );
    }
    showContent();
    return user;
  }

  Future<void> saveInformationUser(
    String name,
  ) async {
    showLoading();
    dataUser.gender = gender.getGender;
    dataUser.birthday = birthDay.formatDdMMYYYY;
    dataUser.nameDisplay = name;

    await FireStoreMethod.uploadImageToStorage(
      dataUser.userId ?? '',
      image ?? Uint8List(0),
    );
    final String photoImage =
        await FireStoreMethod.downImage(dataUser.userId ?? '');
    dataUser.avataUrl = photoImage;
    print('${photoImage} ????????????????');
    await FireStoreMethod.saveInformationUser(
      id: dataUser.userId ?? '',
      user: dataUser,
    );
    showContent();
  }

  Future<Uint8List?> pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    final XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return _file.readAsBytes();
    }
    return null;
  }
}

extension ConvertGender on String {
  bool get getGender {
    switch (this) {
      case 'Nam':
        return true;
      case 'Nữ':
        return false;

      default:
        return true;
    }
  }
}
