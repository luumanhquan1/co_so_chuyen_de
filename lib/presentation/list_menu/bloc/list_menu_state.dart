import 'package:equatable/equatable.dart';

abstract class ListMenuState extends Equatable {
  const ListMenuState();
}

class ListMenuInitial extends ListMenuState {
  @override
  List<Object> get props => [];
}

class Loading extends ListMenuState {
  @override
  List<Object> get props => [];
}
