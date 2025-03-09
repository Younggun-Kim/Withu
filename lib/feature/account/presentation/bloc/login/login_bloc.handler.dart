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

  /// 로그인 버튼 클릭
  void _onBtnPressed(LoginBtnPressed event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: BaseBlocStatus.loading()));

    final LoginResultEntity result = await loginUseCase.login(
      entity: toEntity(),
    );

    emit(state.copyWith(status: result.blocStatus, message: result.message));
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
    emit(state.copyWith(status: BaseBlocStatus.loading()));

    final isLoggedIn = await loginUseCase.requestAppleLogin(
      event.identifyToken,
    );

    emit(state.copyWith(status: BaseBlocStatus.fromSuccess(isLoggedIn)));
    moveAppleNextPage(isLoggedIn);
  }

  void moveAppleNextPage(bool isLoggedIn) {
    if (isLoggedIn) {
      Toast.showWithNavigatorKey(text: '홈으로 이동할 예정입니다.');
    } else {
      getItAppRouter.push(TermRoute(args: TermPageArgs(type: LoginType.apple)));
    }
  }
}
