import 'package:rxdart/rxdart.dart';

class TinTucThoiSuBloc {
  BehaviorSubject<int> dropDownSubject = BehaviorSubject.seeded(1);

  Stream<int> get dropDownStream => dropDownSubject.stream;

  void changeItem(String? nameDrop) {
    switch(nameDrop) {
      case 'Tin radio': {
        dropDownSubject.add(1);
        break;
      }

      case 'Tin trong nước' : {
        dropDownSubject.add(2);
        break;
      }

      default: {
        dropDownSubject.add(1);
      }
    }
  }
}

