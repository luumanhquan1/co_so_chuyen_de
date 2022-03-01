import 'package:ccvc_mobile/data/request/account_request.dart';
import 'package:ccvc_mobile/data/request/edit_person_information/edit_person_information_request.dart';
import 'package:ccvc_mobile/data/response/account/login_response.dart';
import 'package:ccvc_mobile/data/response/account/tinh_huyen_xa/tinh_huyen_xa_response.dart';
import 'package:ccvc_mobile/data/response/edit_person_information/edit_person_information_response.dart';
import 'package:ccvc_mobile/data/response/home/pham_vi_response.dart';
import 'package:ccvc_mobile/data/response/manager_personal_information/manager_personal_information_response.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/data/services/account_service.dart';
import 'package:ccvc_mobile/domain/model/account/data_user.dart';
import 'package:ccvc_mobile/domain/model/account/tinh_huyen_xa/tinh_huyen_xa_model.dart';
import 'package:ccvc_mobile/domain/model/edit_personal_information/data_edit_person_information.dart';
import 'package:ccvc_mobile/domain/model/home/pham_vi_model.dart';
import 'package:ccvc_mobile/domain/model/manager_personal_information/manager_personal_information_model.dart';
import 'package:ccvc_mobile/domain/repository/login_repository.dart';

class AccountImpl implements AccountRepository {
  final AccountService _accountServiceCommon;
final AccountServiceGateWay _accountServiceGateWay;
  AccountImpl(this._accountServiceCommon,this._accountServiceGateWay);

  @override
  Future<Result<DataUser>> login(
      String userName, String passWord, String appCode) {
    return runCatchingAsync<LoginResponse, DataUser>(
        () => _accountServiceCommon.login(LoginRequest(
            username: userName, password: passWord, appCode: appCode)),
        (response) => response.data.toDomainDataUser());
  }

  @override
  Future<Result<ManagerPersonalInformationModel>> getInfo(String id) {
    return runCatchingAsync<ManagerPersonalInformationResponse,
        ManagerPersonalInformationModel>(
      () => _accountServiceCommon.getInfo(id),
      (response) => response.data.toModel(),
    );
  }

  @override
  Future<Result<DataEditPersonInformation>> getEditPerson(
    EditPersonInformationRequest editPersonInformationRequest,
  ) {
    return runCatchingAsync<EditPersonInformationResponse,
        DataEditPersonInformation>(
      () => _accountServiceCommon.editPerson(editPersonInformationRequest),
      (response) => response.data.toDomain(),
    );
  }

  @override
  Future<Result<List<TinhHuyenXaModel>>> getData() {
    return runCatchingAsync<TinhHuyenXaResponse, List<TinhHuyenXaModel>>(
          () => _accountServiceCommon.getData(),
          (res) => res.toDomain(),
    );
  }

  @override
  Future<Result<List<TinhHuyenXaModel>>> getDataChild(String parentId) {
    return runCatchingAsync<TinhHuyenXaResponse, List<TinhHuyenXaModel>>(
          () => _accountServiceCommon.getDataChild(parentId),
          (response) => response.toDomain(),
    );
  }

  @override
  Future<Result<PhamViModel>> getPhamVi() {
    return runCatchingAsync<PhamViResponse, PhamViModel>(
          () => _accountServiceGateWay.getPhamVi(),
          (res) => res.toDomain(),
    );
  }
}
