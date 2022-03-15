import 'package:equatable/equatable.dart';

abstract class DetailState extends Equatable {
  const DetailState();
}

class MainStateInitial extends DetailState {
  @override
  List<Object> get props => [];
}

class Loading extends DetailState {
  @override
  List<Object> get props => [];
}
