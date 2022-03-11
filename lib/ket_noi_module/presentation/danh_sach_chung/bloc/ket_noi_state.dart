import 'package:equatable/equatable.dart';

abstract class KetNoiState extends Equatable {
  const KetNoiState();
}

class MainStateInitial extends KetNoiState {
  @override
  List<Object> get props => [];
}

class Loading extends KetNoiState {
  @override
  List<Object> get props => [];
}
