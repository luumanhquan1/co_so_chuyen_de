import 'package:ccvc_mobile/tien_ich_module/presentation/phien_dich_tu_dong/ui/widget/language_widget.dart';
import 'package:rxdart/rxdart.dart';

class PhienDichTuDongCubit {
  BehaviorSubject<LANGUAGE> languageSubject =
      BehaviorSubject.seeded(LANGUAGE.vn);

  Stream<LANGUAGE> get languageStream => languageSubject.stream;

  BehaviorSubject<int> lengthTextSubject = BehaviorSubject.seeded(0);

  Stream<int> get lengthTextStream => lengthTextSubject.stream;

  String textTranslate = '';

  void swapLanguage() {
    if(languageSubject.value == LANGUAGE.vn) {
      languageSubject.add(LANGUAGE.en);
    } else {
      languageSubject.add(LANGUAGE.vn);
    }
  }
}
