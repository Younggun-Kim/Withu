part of 'home_bloc.dart';

abstract class HomeEvent extends BaseBlocEvent {}

class HomeLogoutPressed extends HomeEvent {}

class HomeBottomNaviPressed extends HomeEvent {
  final int index;

  HomeBottomNaviPressed({required this.index});

  HomeSubPageType get subPage => HomeSubPageType.fromIndex(index);
}
