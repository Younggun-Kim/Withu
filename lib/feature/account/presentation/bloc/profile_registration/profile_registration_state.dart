part of 'profile_registration_bloc.dart';

@freezed
class ProfileRegistrationState extends BaseBlocState
    with _$ProfileRegistrationState {
  factory ProfileRegistrationState({
    required BaseBlocStatus status,

    @Default(ProfileRegistrationStep.first) ProfileRegistrationStep currentStep,

    @Default('') String introduction,
  }) = _ProfileRegistrationState;
}
