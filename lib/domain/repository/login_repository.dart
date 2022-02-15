import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/domain/model/account/data_user.dart';

mixin LoginRepository {
  Future<Result<DataUser>> getAccessToken(
    String userName,
    String passWord,
    String appCode,
  );
}
