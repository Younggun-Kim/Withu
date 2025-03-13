part of 'home_bloc.dart';

extension HomeBlocHandler on HomeBloc {
  /// 홈 초기화
  void _onHomeInitialized(
    HomeInitialized event,
    Emitter<HomeState> emit,
  ) async {
    final profileInfo = await getUserProfileUseCase.exec();
    getItGlobalBloc.add(GlobalUserInfoStored(profileInfo: profileInfo));
  }

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
