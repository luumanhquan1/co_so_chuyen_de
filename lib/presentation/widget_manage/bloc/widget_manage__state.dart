import 'package:equatable/equatable.dart';

abstract class WidgetManageState extends Equatable {
  const WidgetManageState();
}

class MainStateInitial extends WidgetManageState {
  @override
  List<Object> get props => [];
}

class Loading extends WidgetManageState {
  @override
  List<Object> get props => [];
}
