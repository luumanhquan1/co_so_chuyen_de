import 'package:ccvc_mobile/data/request/edit_person_information/edit_person_information_request.dart';
import 'package:ccvc_mobile/data/response/edit_person_information/edit_person_information_response.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/data/services/edit_person_information_service/edit_person_information_service.dart';
import 'package:ccvc_mobile/domain/model/edit_personal_information/data_edit_person_information.dart';
import 'package:ccvc_mobile/domain/model/manager_personal_information/manager_personal_information_model.dart';
import 'package:ccvc_mobile/domain/repository/edit_person/edit_person_repository.dart';

class EditPersonRepositoryImpl implements EditPersonRepository {
  final EditPersonInformationService _editPersonService;

  EditPersonRepositoryImpl(this._editPersonService);

  @override
  Future<Result<DataEditPersonInformation>> getEditPerson(
      EditPersonInformationRequest editPersonInformationRequest,
  ) {
    return runCatchingAsync<EditPersonInformationResponse,
        DataEditPersonInformation>(
      () => _editPersonService.editPerson(editPersonInformationRequest),
      (response) => response.data.toDomain(),
    );
  }
}
