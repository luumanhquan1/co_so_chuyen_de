import 'package:equatable/equatable.dart';

abstract class EditPersonalInformationState extends Equatable {
  const EditPersonalInformationState();
}

class EditPersonalInformationInitial extends EditPersonalInformationState {
  @override
  List<Object> get props => [];
}

class Loading extends EditPersonalInformationState {
  @override
  List<Object> get props => [];
}
