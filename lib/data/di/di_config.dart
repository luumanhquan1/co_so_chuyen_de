import 'package:ccvc_mobile/widgets/calendar/calendar_tablet/src/table_calendar_tablet_cubit.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {required String environment}) async {
  g.registerLazySingleton<TableCalendarTabletCubit>(() =>
      TableCalendarTabletCubit(),);
  }