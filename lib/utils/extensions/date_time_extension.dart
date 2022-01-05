import 'package:intl/intl.dart';

extension DateFormatString on DateTime{
  String get toStringWithAMPM{
    final  dateString = DateFormat.jm('en').format(this);
    return dateString;
  }
}