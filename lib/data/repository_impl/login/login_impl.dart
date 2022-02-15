import 'package:ccvc_mobile/data/response/account/login_response.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/data/services/login_service.dart';
import 'package:ccvc_mobile/domain/model/account/data_user.dart';
import 'package:ccvc_mobile/domain/repository/login_repository.dart';

class LoginImpl implements LoginRepository {
  final LoginClient _loginClient;

  LoginImpl(this._loginClient);

  @override
  Future<Result<DataUser>> getAccessToken(
      String userName,
      String passWord,
      String appCode,
      ) {
    return runCatchingAsync<LoginResponse, DataUser>(
          () => _loginClient.login(userName, passWord, appCode),
          (response) => response.data.toDomainDataUser(),
    );
  }
}
