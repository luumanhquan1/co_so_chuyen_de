import 'package:equatable/equatable.dart';

abstract class ManagerPersonalInformationState extends Equatable {
  const ManagerPersonalInformationState();
}

class BaseChooseTimeInitial extends ManagerPersonalInformationState {
  @override
  List<Object> get props => [];
}

class Loading extends ManagerPersonalInformationState {
  @override
  List<Object> get props => [];
}
