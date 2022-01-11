import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/manager_personal_information/manager_personal_information_model.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/bloc/manager_personal_information_state.dart';


class ManagerPersonalInformationCubit
    extends BaseCubit<ManagerPersonalInformationState> {
  ManagerPersonalInformationCubit() : super(BaseChooseTimeInitial());

  ManagerPersonalInformationModel managerPersonalInformationModel =
      ManagerPersonalInformationModel.fakeData;
}
