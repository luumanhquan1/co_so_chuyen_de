import 'package:equatable/equatable.dart';

abstract class DanhBaState extends Equatable {
  const DanhBaState();
}

class SearchInit extends DanhBaState {
  @override
  List<Object> get props => [];
}

class MainStateInitial extends DanhBaState {
  @override
  List<Object> get props => [];
}

class Loading extends DanhBaState {
  @override
  List<Object> get props => [];
}
