import 'package:equatable/equatable.dart';

abstract class TinTucThoiSuState extends Equatable {
  const TinTucThoiSuState();
}

class TinTucThoiSuStateInitial extends TinTucThoiSuState {
  @override
  List<Object> get props => [];
}

class Loading extends TinTucThoiSuState {
  @override
  List<Object> get props => [];
}