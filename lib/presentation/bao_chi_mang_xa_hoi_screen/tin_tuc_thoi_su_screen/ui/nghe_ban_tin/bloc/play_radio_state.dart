import 'package:equatable/equatable.dart';

abstract class PlayRadioState extends Equatable {
  const PlayRadioState();
}

class PlayRadioStateInitial extends PlayRadioState {
  @override
  List<Object> get props => [];
}

class Loading extends PlayRadioState {
  @override
  List<Object> get props => [];
}
