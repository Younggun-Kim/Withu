part of 'sign_up_bloc.dart';

extension SignUpBlocHandler on SignUpBloc {
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

  /// 이메일 입력
  void _onSignUpEmailInputted(
    SignUpEmailInputted event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(email: event.value));
  }
}
