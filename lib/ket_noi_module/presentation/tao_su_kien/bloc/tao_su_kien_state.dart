import 'package:equatable/equatable.dart';

abstract class TaoSuKienState extends Equatable {
  const TaoSuKienState();
}

class MainStateInitial extends TaoSuKienState {
  @override
  List<Object> get props => [];
}

class Loading extends TaoSuKienState {
  @override
  List<Object> get props => [];
}
