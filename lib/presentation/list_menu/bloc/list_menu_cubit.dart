import 'package:bloc/bloc.dart';
import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:meta/meta.dart';

part 'list_menu_state.dart';

class ListMenuCubit extends BaseCubit<ListMenuState> {
  ListMenuCubit() : super(ListMenuInitial());
}
