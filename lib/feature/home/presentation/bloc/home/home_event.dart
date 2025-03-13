part of 'home_bloc.dart';

abstract class HomeEvent extends BaseBlocEvent {}

/// 초기화
class HomeInitialized extends HomeEvent {}

class HomeLogoutPressed extends HomeEvent {}

class HomeBottomNaviPressed extends HomeEvent {
  final int index;

  HomeBottomNaviPressed({required this.index});

  HomeSubPageType get subPage => HomeSubPageType.fromIndex(index);
}
