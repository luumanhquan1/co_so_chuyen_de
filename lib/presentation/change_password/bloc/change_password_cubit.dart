import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/presentation/change_password/bloc/change_password_state.dart';

class ChangePasswordCubit extends BaseCubit<ChangePasswordSate> {
  ChangePasswordCubit() : super(ChangePasswordSateIntial());

  bool isHideClearData = false;
  bool isCheckEye1 = true;
  bool isCheckEyeXacNhan = true;
  bool isHideEyeXacNhan = false;
  bool isHideEye1 = false;
  bool passIsError = false;
}
