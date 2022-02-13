import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/presentation/login/bloc/login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit() : super(LoginStateIntial());

  bool isHideClearData=false;
  bool isCheckEye1=false;
  bool isHideEye1=false;
}
