import 'package:equatable/equatable.dart';

abstract class IncomingDocumentState extends Equatable {
  const IncomingDocumentState();
}

class IncomingDocumentStateIntial extends IncomingDocumentState {
  @override
  List<Object?> get props => [];
}
