import 'package:ccvc_mobile/data/request/edit_person_information/edit_person_information_request.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/domain/model/edit_personal_information/data_edit_person_information.dart';

mixin EditPersonRepository {
  Future<Result<DataEditPersonInformation>> getEditPerson(
    EditPersonInformationRequest editPersonInformationRequest,
  );
}
