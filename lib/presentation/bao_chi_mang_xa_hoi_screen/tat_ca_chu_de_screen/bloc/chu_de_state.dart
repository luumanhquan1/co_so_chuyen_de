import 'package:equatable/equatable.dart';

abstract class ChuDeState extends Equatable {
  const ChuDeState();
}

class ChuDeStateInitial extends ChuDeState {
  @override
  List<Object> get props => [];
}

class Loading extends ChuDeState {
  @override
  List<Object> get props => [];
}
