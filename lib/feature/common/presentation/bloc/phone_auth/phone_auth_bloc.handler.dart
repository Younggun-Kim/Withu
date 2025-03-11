part of 'phone_auth_bloc.dart';

extension PhoneAuthBlocHandler on PhoneAuthBloc {
  /// 초기화
  void _onPhoneAuthInitialized(
    PhoneAuthInitialized event,
    Emitter<PhoneAuthState> emit,
  ) {
    emit(PhoneAuthState(status: BaseBlocStatus.initial()));
  }

  /// 휴대폰 번호 입력 이벤트.
  void _onPhoneInputted(
    PhoneAuthPhoneInputted event,
    Emitter<PhoneAuthState> emit,
  ) {
    emit(
      state.copyWith(
        phone: event.phone,
        isSuccessSend: false,
        sessionId: '',
        authCode: AuthCodeValue(),
        verifyState: VerifyStateType.beforeSend,
      ),
    );
  }

  /// 인증번호 전송 요청 이벤트.
  void _onAuthCodeRequested(
    PhoneAuthAuthCodeSent event,
    Emitter<PhoneAuthState> emit,
  ) async {
    if (!state.canRequestVerification) {
      Toast.showWithNavigatorKey(text: '유효한 휴대폰번호를 입력해주세요.');

      return;
    }

    emit(state.copyWith(status: BaseBlocStatus.loading()));

    final response = await phoneAuthUseCase.sendAuthCode(
      phone: state.phone.value,
    );

    emit(
      state.copyWith(
        status: BaseBlocStatus.fromSuccess(response.isSuccess),
        isSuccessSend: response.isSuccess,
        sessionId: response.sessionId,
        verifyState: VerifyStateType.getSentState(response.isSuccess),
      ),
    );
  }

  /// 인증번호 입력 이벤트.
  void _onAuthCodeInputted(
    PhoneAuthAuthCodeInputted event,
    Emitter<PhoneAuthState> emit,
  ) async {
    emit(state.copyWith(authCode: event.code));
  }

  /// 인증 요청
  void _onPhoneAuthVerifyRequested(
    PhoneAuthVerifyRequested event,
    Emitter<PhoneAuthState> emit,
  ) async {
    if (state.canAuthCodeVerification) {
      emit(state.copyWith(status: BaseBlocStatus.loading()));

      final isVerify = await phoneAuthUseCase.verifyAuthCode(
        sessionId: state.sessionId,
        authCode: state.authCode,
      );

      emit(
        state.copyWith(
          status: BaseBlocStatus.fromSuccess(isVerify),
          verifyState: VerifyStateType.getVerificationState(isVerify),
        ),
      );
    }
  }
}
