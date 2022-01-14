import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInit extends SearchState {
  @override
  List<Object> get props => [];
}

class Loading extends SearchState {
  @override
  List<Object> get props => [];
}
