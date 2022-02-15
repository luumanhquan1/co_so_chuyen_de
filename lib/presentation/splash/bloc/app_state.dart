import 'package:ccvc_mobile/domain/locals/prefs_service.dart';
import 'package:rxdart/rxdart.dart';

class AppState {
  final BehaviorSubject<String> getToken = BehaviorSubject<String>();
  void getTokenPrefs() {
    final token = PrefsService.getLogin();
    getToken.sink.add(token);
  }

  void setToken(String token) {
    PrefsService.saveLogin(token);
    getToken.sink.add(token);
  }
}
