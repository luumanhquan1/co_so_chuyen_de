import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/login/bloc/login_state.dart';
import 'package:rxdart/rxdart.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit() : super(LoginStateIntial());
  final BehaviorSubject<bool> _isShowPassword = BehaviorSubject<bool>();
  final BehaviorSubject<bool> _showEmptyTextTaiKhoan = BehaviorSubject<bool>();
  final BehaviorSubject<bool> _showEmptyTextPassword = BehaviorSubject<bool>();
  final BehaviorSubject<bool> _savePassword = BehaviorSubject<bool>();

  Stream<bool> get isShowPassword => _isShowPassword.stream;

  Stream<bool> get isShowNotEmptyText => _showEmptyTextTaiKhoan.stream;

  Stream<bool> get isShowNotEmptyTextPassword => _showEmptyTextPassword.stream;

  Stream<bool> get savePassword => _savePassword.stream;

  void getIsShowPassWord({required bool isShow}) {
    _isShowPassword.sink.add(isShow);
  }

  void getShowEmptyTextTaiKhoan({required bool isShow}) {
    _showEmptyTextTaiKhoan.sink.add(isShow);
  }

  void getShowEmptyTextPassword({required bool isShow}) {
    _showEmptyTextPassword.sink.add(isShow);
  }

  void setSavePassword({required bool isSave}) {
    _savePassword.sink.add(isSave);
  }

  void dispose() {
    _isShowPassword.close();
    _showEmptyTextTaiKhoan.close();
    _showEmptyTextPassword.close();
  }

  validateInputText(String inputText) {
    if (inputText.isEmpty) {
      return S.current.khong_the_bo_trong;
    }
    return;
  }
}
