part of 'email_login_bloc.dart';

extension EmailLoginBlocHandler on EmailLoginBloc {
  /// 이메일 입력
  void _onEmailLoginEmailInputted(
    EmailLoginEmailInputted event,
    Emitter<EmailLoginState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  /// 비밀번호 입력
  void _onEmailLoginPasswordInputted(
    EmailLoginPasswordInputted event,
    Emitter<EmailLoginState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  /// 로그인 버튼 클릭
  void _onEmailLoginSubmitted(
    EmailLoginSubmitted event,
    Emitter<EmailLoginState> emit,
  ) async {
    emit(state.copyWith(status: BaseBlocStatus.loading()));

    final isLoggedIn = await loginUseCase.requestEmailLogin(
      email: state.email,
      password: state.password,
    );

    emit(state.copyWith(status: BaseBlocStatus.fromSuccess(isLoggedIn)));
  }
}
