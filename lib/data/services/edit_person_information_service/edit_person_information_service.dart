import 'package:ccvc_mobile/data/request/edit_person_information/edit_person_information_request.dart';
import 'package:ccvc_mobile/data/response/edit_person_information/edit_person_information_response.dart';
import 'package:ccvc_mobile/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'edit_person_information_service.g.dart';

@RestApi()
abstract class EditPersonInformationService {
  @factoryMethod
  factory EditPersonInformationService(Dio dio, {String baseUrl}) =
      _EditPersonInformationService;

  @POST(ApiConstants.EDIT_PERSON_INFORMATION)
  Future<EditPersonInformationResponse> editPerson(
    @Body() EditPersonInformationRequest editPersonInformationRequest,
  );
}
