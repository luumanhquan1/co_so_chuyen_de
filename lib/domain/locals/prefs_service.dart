import 'package:ccvc_mobile/domain/model/account/LoginModel.dart';
import 'package:ccvc_mobile/domain/model/account/data_user.dart';
import 'package:ccvc_mobile/domain/model/account/user_infomation.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static const _PREF_LANGUAGE = 'pref_language';
  static const _PREF_LOGIN = 'pref_login';
  static const _PREF_DATA_USER = 'pref_data_user';

  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();

  // call this method form iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static String getLogin() {
    return _prefsInstance?.getString(_PREF_LOGIN) ?? jsonLoginModelEmpty();
  }

  static Future<bool> saveLogin(String data) async {
    final prefs = await _instance;
    return prefs.setString(_PREF_LOGIN, data);
  }

  static Future<bool> saveDataUser(String data) async {
    final prefs = await _instance;
    return prefs.setString(_PREF_DATA_USER, data);
  }
  static String getDataUser(){
    return _prefsInstance?.getString(_PREF_DATA_USER) ?? jsonDataUserModelEmpty();
  }

  static String jsonLoginModelEmpty() {
    return loginToJson(
      LoginModel(
        accessToken: '',
        refreshToken: '',
      ),
    );
  }

  static String jsonDataUserModelEmpty() {
    return dataUserToJson(
      DataUser(
          username: '',
          userId: '',
          userInformation: UserInformation(
            id: '',
            canBoDepartmentId: '',
            hoTen: '',
            anhDaiDienFilePath: '',
            chucVu: '',
            donVi: '',
            email: '',
            userName: '',
            userCanBoDepartmentId: '',
            donViGoc: DonViGoc(
              chucVu: '',
              chucVuId: '',
              id: '',
              tenDonVi: '',
            ),
            donViTrucThuoc: DonViTrucThuoc(
              tenDonVi: '',
              id: '',
              chucVuId: '',
              chucVu: '',
            ),
            gioiTinh: null,
            ngaySinh: '',
            soDienThoai: null,
          )),
    );
  }

  static Future<bool> saveLanguage(String code) async {
    final prefs = await _instance;
    return prefs.setString(_PREF_LANGUAGE, code);
  }

  static String getLanguage() {
    return _prefsInstance?.getString(_PREF_LANGUAGE) ?? VI_CODE;
  }

  Future<void> clearData() async {
    await _prefsInstance?.clear();
    return;
  }
}
