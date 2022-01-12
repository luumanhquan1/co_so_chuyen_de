import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/edit_personal_information/edit_personal_information_model.dart';
import 'package:ccvc_mobile/presentation/edit_personal_information/bloc/edit_personal_information_state.dart';

class EditPersonalInformationCubit
    extends BaseCubit<EditPersonalInformationState> {
  EditPersonalInformationCubit() : super(EditPersonalInformationInitial());
  String ngaySinh = '';
  bool gioiTinh = false;
  EditPersonalInformationModel? editPersonalInformationModel;

  Future<void> getCurrentUnit(
    EditPersonalInformationModel editPersonalInformationModel,
  ) async {
    this.editPersonalInformationModel = editPersonalInformationModel;
    ngaySinh = editPersonalInformationModel.ngaySinh ?? '';
    gioiTinh = editPersonalInformationModel.gioiTinh ?? false;
  }

  Future<void> selectGTEvent(bool gioiTinh) async {
    this.gioiTinh = gioiTinh;
  }

  Future<void> selectBirthdayEvent(String birthday) async {
    ngaySinh = birthday;
  }

  void dispose() {}
}
