import 'package:ccvc_mobile/data/helper/firebase/firebase_store.dart';
import 'package:ccvc_mobile/domain/locals/prefs_service.dart';
import 'package:ccvc_mobile/domain/model/fcm_tokken_model.dart';

import 'package:rxdart/rxdart.dart';

class AppState {
  String token = '';

  String userId = '';

  FcmTokenModel tokenFcm = FcmTokenModel.empty();

  final BehaviorSubject<String> getToken = BehaviorSubject<String>();

  void getTokenPrefs() {
    token = PrefsService.getUserId();
    getToken.sink.add(token);
  }

  Future<void> getDataRefeshToken() async {
    userId = PrefsService.getUserId();
    tokenFcm = await FireStoreMethod.getTokenFcm(id: userId);
  }
}
