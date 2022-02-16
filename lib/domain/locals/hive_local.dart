import 'package:ccvc_mobile/domain/model/account/data_user.dart';
import 'package:ccvc_mobile/domain/model/account/user_infomation.dart';
import 'package:hive/hive.dart';

class HiveLocal {
  static const USER_INFO = 'USER_INFO';
  static late Box<DataUser> _userBox;

  static Future<void> init() async {
    Hive.registerAdapter(DataUserAdapter());
    Hive.registerAdapter(UserInformationAdapter());
    Hive.registerAdapter(DonViGocAdapter());
    Hive.registerAdapter(DonViTrucThuocAdapter());
    _userBox = await Hive.openBox(USER_INFO);
  }

  static void saveDataUser(DataUser dataUser) {
    _userBox.add(dataUser);
  }

  static void clearData() {
    _userBox.clear();
  }

  static DataUser? getDataUser() {
    final data = _userBox.values;
    if (data.isNotEmpty) {
      return data.first;
    }
  }
}
