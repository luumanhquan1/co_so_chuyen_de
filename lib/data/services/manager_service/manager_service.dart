import 'package:ccvc_mobile/data/request/edit_person_information/edit_person_information_request.dart';
import 'package:ccvc_mobile/data/response/edit_person_information/edit_person_information_response.dart';
import 'package:ccvc_mobile/data/response/manager_personal_information/manager_personal_information_response.dart';
import 'package:ccvc_mobile/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'manager_service.g.dart';

@RestApi()
abstract class ManagerService {
  @factoryMethod
  factory ManagerService(Dio dio, {String baseUrl}) = _ManagerService;

  @GET(ApiConstants.GET_INFO)
  Future<ManagerPersonalInformationResponse> getInfo(@Query('id') String id);

  @POST(ApiConstants.EDIT_PERSON_INFORMATION)
  Future<EditPersonInformationResponse> editPerson(
    @Body() EditPersonInformationRequest editPersonInformationRequest,
  );
}
