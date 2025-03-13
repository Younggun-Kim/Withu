part of 'profile_registration_bloc.dart';

typedef ProfileRegistrationEmitter = Emitter<ProfileRegistrationState>;

extension ProfileRegistrationBlocHandler on ProfileRegistrationBloc {
  /// 다음 스탭으로 이동
  void _onProfileRegistrationStepForwarded(
    ProfileRegistrationStepForwarded event,
    ProfileRegistrationEmitter emit,
  ) {
    emit(state.copyWith(currentStep: state.currentStep.getNextStep()));
  }
}
