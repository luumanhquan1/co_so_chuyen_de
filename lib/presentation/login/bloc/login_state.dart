import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginStateIntial extends LoginState {
  @override
  List<Object?> get props => [];
}
