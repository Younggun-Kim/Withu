part of 'profile_registration_bloc.dart';

@freezed
class ProfileRegistrationState extends BaseBlocState
    with _$ProfileRegistrationState {
  factory ProfileRegistrationState({
    required BaseBlocStatus status,

    @Default(ProfileRegistrationStep.first) ProfileRegistrationStep currentStep,

    /// 자기소개
    @Default(IntroductionValue()) IntroductionValue introduction,

    /// 전문분야
    @Default(FieldType.none) FieldType field,

    /// 포트폴리오 이미지 목록
    @Default([]) List<ImageFileValue> portfolioImages,

    /// 경력 목록
    @Default([]) List<CareerEntity> careers,

    /// 새 경력 입력 여부
    @Default(false) bool hasNewCareer,

    /// 프로필 이미지
    ImageFileValue? profileImage,
  }) = _ProfileRegistrationState;
}

extension ProfileRegistrationStateEx on ProfileRegistrationState {
  int get maxImageCount => 10;

  bool get isPortfolioFull => portfolioImages.length >= maxImageCount;

  bool isEnabledNextBtn() {
    switch (currentStep) {
      case ProfileRegistrationStep.introduction:
        return introduction.isValid();
      case ProfileRegistrationStep.field:
        return !field.isNone;
      case ProfileRegistrationStep.portfolio:
        return portfolioImages.isNotEmpty;
      case ProfileRegistrationStep.career:
        return false;
      case ProfileRegistrationStep.area:
        return false;
      case ProfileRegistrationStep.profile:
        return true;
    }
  }
}
