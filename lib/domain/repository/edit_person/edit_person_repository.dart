import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/domain/model/edit_personal_information/data_edit_person_information.dart';

mixin EditPersonRepository {
  Future<Result<DataEditPersonInformation>> getEditPerson(
    String id,
  );
}
