import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'list_menu_state.dart';

class ListMenuCubit extends Cubit<ListMenuState> {
  ListMenuCubit() : super(ListMenuInitial());
}
