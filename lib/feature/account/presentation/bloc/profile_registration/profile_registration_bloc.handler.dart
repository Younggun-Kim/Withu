part of 'profile_registration_bloc.dart';

typedef ProfileRegistrationEmitter = Emitter<ProfileRegistrationState>;

extension ProfileRegistrationBlocHandler on ProfileRegistrationBloc {
  /// 다음 스탭으로 이동
  void _onProfileRegistrationStepForwarded(
    ProfileRegistrationStepForwarded event,
    ProfileRegistrationEmitter emit,
  ) {
    final isCompany = true;
    emit(state.copyWith(currentStep: state.currentStep.getNextStep(isCompany)));
  }

  /// 자기소개 입력
  void _onProfileRegistrationIntroductionInputted(
    ProfileRegistrationIntroductionInputted event,
    ProfileRegistrationEmitter emit,
  ) {
    emit(state.copyWith(introduction: event.introduction));
  }
}
