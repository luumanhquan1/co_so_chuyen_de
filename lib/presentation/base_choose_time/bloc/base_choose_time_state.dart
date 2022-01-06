import 'package:equatable/equatable.dart';

abstract class BaseChooseTimeState extends Equatable {
  const BaseChooseTimeState();
}

class BaseChooseTimeInitial extends BaseChooseTimeState {
  @override
  List<Object> get props => [];
}

class Loading extends BaseChooseTimeState {
  @override
  List<Object> get props => [];
}
