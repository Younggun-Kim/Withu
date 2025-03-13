part of 'profile_registration_bloc.dart';

@freezed
class ProfileRegistrationState extends BaseBlocState
    with _$ProfileRegistrationState {
  factory ProfileRegistrationState({
    required BaseBlocStatus status,

    @Default(ProfileRegistrationStep.first) ProfileRegistrationStep currentStep,

    @Default(IntroductionValue()) IntroductionValue introduction,

    @Default(FieldType.none) FieldType field,
  }) = _ProfileRegistrationState;
}

extension ProfileRegistrationStateEx on ProfileRegistrationState {
  bool isEnabledNextBtn() {
    switch (currentStep) {
      case ProfileRegistrationStep.introduction:
        return introduction.isValid();
      case ProfileRegistrationStep.field:
        return !field.isNone;
      case ProfileRegistrationStep.portfolio:
        return false;
      case ProfileRegistrationStep.career:
        return false;
      case ProfileRegistrationStep.area:
        return false;
      case ProfileRegistrationStep.profile:
        return false;
    }
  }
}
