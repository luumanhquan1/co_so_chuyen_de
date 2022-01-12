import 'package:equatable/equatable.dart';

abstract class OutgoingDocumentState extends Equatable {
  const OutgoingDocumentState();
}

class OutgoingDocumentStateIntial extends OutgoingDocumentState {
  @override
  List<Object?> get props => [];
}
