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

    final isLoggedIn = await loginUseCase.requestSnsLogin(identifyToken);

    emit(state.copyWith(status: BaseBlocStatus.fromSuccess(isLoggedIn)));

    moveAppleNextPage(isLoggedIn);
  }

  void moveAppleNextPage(bool isLoggedIn) {
    if (isLoggedIn) {
      AppRouterEx.moveHome();
    } else {
      getItAppRouter.push(TermRoute());
    }
  }

  void _onLoginEmailSignUpPressed(
    LoginEmailSignUpPressed event,
    Emitter<LoginState> emit,
  ) async {
    getItGlobalBloc.add(
      GlobalSignUpArgsStored(
        args: SignUpArgsValue(
          signUpMethod: SignUpMethodType.email,
          tempToken: '',
        ),
      ),
    );
    getItAppRouter.push(TermRoute());
  }
}
