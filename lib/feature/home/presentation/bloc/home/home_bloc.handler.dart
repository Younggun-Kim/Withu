part of 'home_bloc.dart';

extension HomeBlocHandler on HomeBloc {
  void _onHomeLogoutPressed(
    HomeLogoutPressed event,
    Emitter<HomeState> emit,
  ) async {
    await loginUseCase.logout();
  }

  _onHomeBottomNaviPressed(
    HomeBottomNaviPressed event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(currentPage: event.subPage));
  }
}
