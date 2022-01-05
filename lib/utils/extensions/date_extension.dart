import 'package:ccvc_mobile/generated/l10n.dart';

extension DateExtension on DateTime{
  String getDayofWeekTxt() {
    switch (weekday) {
      case 1:
        return S.current.thu_hai;
      case 2:
        return S.current.thu_ba;
      case 3:
        return S.current.thu_tu;
      case 4:
        return S.current.thu_nam;
      case 5:
        return S.current.thu_sau;
      case 6:
        return S.current.thu_bay;
      case 7:
        return S.current.chu_nhat;
    }
    return '';
  }
}