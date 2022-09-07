import 'package:equatable/equatable.dart';

abstract class OtpState extends Equatable {
  const OtpState();
}

class OtpStateIntial extends OtpState {


  @override
  List<Object?> get props => [];
}

class MainMessageStateError extends OtpState {
  final String error;

  const MainMessageStateError(this.error);

  @override
  List<Object?> get props => [error];
}