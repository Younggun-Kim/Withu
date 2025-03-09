part of 'sign_up_bloc.dart';

extension SignUpBlocHandler on SignUpBloc {
  void _onSignUpArgsStored(SignUpArgsStored event, Emitter<SignUpState> emit) {
    logger.i(event.value.businessNum);
    emit(state.copyWith(args: event.value));
  }

  void _onSignUpRequestSent(
    SignUpRequestSent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(status: BaseBlocStatus.loading()));
  }

  void _onSignUpRequestCompleted(
    SignUpRequestCompleted event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(status: BaseBlocStatus.initial()));
  }

  /// 이름 입력
  void _onSignUpNameInputted(
    SignUpNameInputted event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(name: event.name));
  }

  /// 생년월일 입력
  void _onSignUpBirthDateInputted(
    SignUpBirthDateInputted event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(birthDate: event.value));
  }

  /// 성별 선택
  void _onSignUpGenderSelected(
    SignUpGenderSelected event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(gender: event.value));
  }

  void _onSignUpPhoneNumInputted(
    SignUpPhoneNumInputted event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(phone: event.value));
  }

  void _onSignUpPhoneVerifyChanged(
    SignUpPhoneVerifyChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(isPhoneVerify: event.value));
  }

  /// 이메일 입력
  void _onSignUpEmailInputted(
    SignUpEmailInputted event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(email: event.value));
  }

  /// 비밀번호 입력
  void _onSignUpPasswordInputted(
    SignUpPasswordInputted event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  /// 채널 선택
  void _onSignUpChannelSelected(
    SignUpChannelSelected event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(channel: event.value));
  }

  /// 추천인 아이디 입력
  void _onSignUpReferrerUserInputted(
    SignUpReferrerUserInputted event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(referrerUser: event.value));
  }

  /// 다음 버튼 클릭
  void _onSignUpRequested(
    SignUpRequested event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(status: BaseBlocStatus.loading()));

    final result = await signUpUseCase.signUpCompanyRequested(state.toEntity());

    emit(
      state.copyWith(
        status: BaseBlocStatus.fromSuccess(result.isSuccess),
        message: result.message,
      ),
    );
  }
}
