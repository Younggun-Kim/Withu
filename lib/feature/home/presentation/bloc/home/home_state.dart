part of 'home_bloc.dart';

@freezed
class HomeState extends BaseBlocState with _$HomeState {
  factory HomeState({
    required BaseBlocStatus status,

    @Default(HomeSubPageType.calendar) HomeSubPageType currentPage,
  }) = _HomeState;
}
