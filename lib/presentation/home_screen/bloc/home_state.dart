import 'package:ccvc_mobile/domain/model/post_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeStateInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeStateLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeStateLoadedSuccess extends HomeState{
  final List<PostModel> posts;
  final int unreadNoti;

  HomeStateLoadedSuccess({required this.posts,required this.unreadNoti});

  @override
  List<Object> get props => [posts, unreadNoti];
}

class HomeStateLoadedFail extends HomeState {
  @override
  List<Object> get props => [];
}