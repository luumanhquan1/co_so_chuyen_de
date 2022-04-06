import 'package:rxdart/rxdart.dart';

class MenuCalendarCubit {
  BehaviorSubject<List<bool>> selectTypeCalendarSubject =
      BehaviorSubject.seeded([true, false, false]);

  BehaviorSubject<int> index = BehaviorSubject.seeded(0);
}
