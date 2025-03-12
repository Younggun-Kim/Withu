part of 'login_bloc.dart';

extension LoginBlocHandler on LoginBloc {
  /// 메시지 초기화
  void _onMessageCleared(LoginMessageCleared event, Emitter<LoginState> emit) {
    emit(state.copyWith(status: BaseBlocStatus.initial(), message: ''));
  }

  /// 로그인 버튼 활성화 상태 체크 및 emit
  void _checkLoginEnabled(Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        isEnabledLogin: state.checkLoginEnabled(
          loginId: state.loginId,
          password: state.password,
        ),
      ),
    );
  }

  /// 아이디 입력
  void _onIdInputted(LoginIdInputted event, Emitter<LoginState> emit) {
    emit(state.copyWith(loginId: event.loginId));
    _checkLoginEnabled(emit);
  }

  /// 비밀번호 입력
  void _onPasswordInputted(
    LoginPasswordInputted event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(password: event.password));
    _checkLoginEnabled(emit);
  }

  /// 비밀번호 표시 토글
  void _onVisiblePasswordToggled(
    LoginVisiblePasswordToggled event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(isVisiblePassword: !state.isVisiblePassword));
  }

  /// 애플 로그인
  void _onLoginAppleRequested(
    LoginAppleRequested event,
    Emitter<LoginState> emit,
  ) async {
    /// Apple 토큰
    final identifyToken = await AppleLogin().getCredential();

    if (identifyToken.isEmpty) return;

    emit(state.copyWith(status: BaseBlocStatus.loading()));

    final response = await loginUseCase.requestAppleLogin(identifyToken);

    emit(
      state.copyWith(status: BaseBlocStatus.fromSuccess(response.isLoggedIn)),
    );

    moveAppleNextPage(response);
  }

  void moveAppleNextPage(SnsLoginResValue response) {
    if (response.isLoggedIn) {
      AppRouterEx.moveHome();
    } else {
      loginUseCase.storeSnsSignUpData(LoginType.apple, response.tempToken);
      getItAppRouter.push(TermRoute());
    }
  }

  void _onLoginEmailSignUpPressed(
    LoginEmailSignUpPressed event,
    Emitter<LoginState> emit,
  ) async {
    loginUseCase.storeEmailSignUpData();
    getItAppRouter.push(TermRoute());
  }
}
