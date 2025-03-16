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

    /// 경력 폼 이름
    @Default(NameValue()) NameValue careerFormName,

    /// 경력 폼 내용
    @Default(CareerContentValue()) CareerContentValue careerFormContent,

    /// 경력 폼 회사 이름
    @Default(CompanyNameValue()) CompanyNameValue careerFormCompany,

    /// 경력 폼 시작 날짜
    @Default(CareerDateValue()) CareerDateValue careerFormStartDate,

    /// 경력 폼 종료 날짜
    @Default(CareerDateValue()) CareerDateValue careerFormEndDate,

    @Default([]) AreaEntities areas,

    /// 프로필 이미지
    ImageFileValue? profileImage,
  }) = _ProfileAddState;
}

extension ProfileAddStateEx on ProfileAddState {
  int get maxImageCount => 10;

  int get maxAreaCount => 5;

  bool get isPortfolioFull => portfolioImages.length >= maxImageCount;

  bool get isAreaFull => areas.length >= maxAreaCount;

  bool get hasProfileUrl => profileImage?.hasUrl == true;

  CareerEntity get careerFormEntity => CareerEntity(
    name: careerFormName,
    content: careerFormContent,
    companyName: careerFormCompany,
    startDate: careerFormStartDate,
    endDate: careerFormEndDate,
  );

  bool isEnabledNextBtn() {
    switch (currentStep) {
      case ProfileAddStep.introduction:
        return introduction.isValid();
      case ProfileAddStep.field:
        return !field.isNone;
      case ProfileAddStep.portfolio:
        return portfolioImages.isNotEmpty;
      case ProfileAddStep.career:
        return careers.isNotEmpty;
      case ProfileAddStep.area:
        return areas.isNotEmpty;
      case ProfileAddStep.profile:
        return true;
    }
  }

  /// 이미지는 API를 통해 서버에 등록한 URL을 넣어주기
  ProfileUpdateValue toUpdateValue({
    required String profileImageUrl,
    required List<String> portfolioImageUrls,
  }) {
    return ProfileUpdateValue(
      introduction: introduction.value,
      field: field,
      profileImageUrl: profileImageUrl,
      portfolioImageUrls: portfolioImageUrls,
      careers: careers,
      areas: areas,
    );
  }
}
