part of 'email_login_bloc.dart';

extension EmailLoginBlocHandler on EmailLoginBloc {
  void _onEmailLoginEmailInputted(
    EmailLoginEmailInputted event,
    Emitter<EmailLoginState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  void _onEmailLoginPasswordInputted(
    EmailLoginPasswordInputted event,
    Emitter<EmailLoginState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  void _onEmailLoginSubmitted(
    EmailLoginSubmitted event,
    Emitter<EmailLoginState> emit,
  ) async {
    emit(state.copyWith(status: BaseBlocStatus.loading()));

    final isLoggedIn = await emailLoginUseCase.login(
      email: state.email,
      password: state.password,
    );

    emit(state.copyWith(status: BaseBlocStatus.fromSuccess(isLoggedIn)));
  }
}
