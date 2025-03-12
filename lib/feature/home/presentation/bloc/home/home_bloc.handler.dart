part of 'home_bloc.dart';

extension HomeBlocHandler on HomeBloc {
  void _onHomeLogoutPressed(
    HomeLogoutPressed event,
    Emitter<HomeState> emit,
  ) async {
    await loginUseCase.logout();
  }
}
