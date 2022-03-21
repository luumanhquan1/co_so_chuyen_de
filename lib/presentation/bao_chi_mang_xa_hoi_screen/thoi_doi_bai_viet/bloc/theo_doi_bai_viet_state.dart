import 'package:equatable/equatable.dart';

abstract class TheoDoiState extends Equatable {
  const TheoDoiState();
}

class TheoDoiStateInitial extends TheoDoiState {
  @override
  List<Object> get props => [];
}

class Loading extends TheoDoiState {
  @override
  List<Object> get props => [];
}
