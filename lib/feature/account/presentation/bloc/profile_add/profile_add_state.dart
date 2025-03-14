part of 'profile_add_bloc.dart';

@freezed
class ProfileAddState extends BaseBlocState with _$ProfileAddState {
  factory ProfileAddState({
    required BaseBlocStatus status,

    @Default(ProfileAddStep.first) ProfileAddStep currentStep,

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

    /// 새 경력 입력 여부
    @Default(CareerEntity()) CareerEntity careerFormData,

    /// 프로필 이미지
    ImageFileValue? profileImage,
  }) = _ProfileAddState;
}

extension ProfileAddStateEx on ProfileAddState {
  int get maxImageCount => 10;

  bool get isPortfolioFull => portfolioImages.length >= maxImageCount;

  int get careerFormDataIndex {
    return careers.reversed.toList().indexOf(careerFormData) + 1;
  }

  bool isEnabledNextBtn() {
    switch (currentStep) {
      case ProfileAddStep.introduction:
        return introduction.isValid();
      case ProfileAddStep.field:
        return !field.isNone;
      case ProfileAddStep.portfolio:
        return portfolioImages.isNotEmpty;
      case ProfileAddStep.career:
        return false;
      case ProfileAddStep.area:
        return false;
      case ProfileAddStep.profile:
        return true;
    }
  }
}
