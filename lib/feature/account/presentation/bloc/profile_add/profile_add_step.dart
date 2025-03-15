import 'dart:math';
import 'package:withu/core/utils/resource/string_res.dart';

enum ProfileAddStep {
  introduction(isOnlyStaff: false),
  field(isOnlyStaff: false),
  career(isOnlyStaff: true),
  portfolio(isOnlyStaff: false),
  area(isOnlyStaff: true),
  profile(isOnlyStaff: false);

  final bool isOnlyStaff;

  const ProfileAddStep({required this.isOnlyStaff});

  static const ProfileAddStep first = introduction;

  static List<ProfileAddStep> getValuesWith(bool isCompany) {
    if (isCompany) {
      return ProfileAddStep.getCompanySteps();
    } else {
      return ProfileAddStep.values;
    }
  }

  static List<ProfileAddStep> getCompanySteps() {
    return values.where((type) => !type.isOnlyStaff).toList();
  }
}

extension ProfileRegistrationStepEx on ProfileAddStep {
  bool get isFirst => this == ProfileAddStep.first;

  bool get isLast => this == ProfileAddStep.profile;

  /// UserType에 따른 현재 인덱스 얻기
  int getIndexWith(bool isCompany) {
    return ProfileAddStep.getValuesWith(isCompany).indexOf(this);
  }

  ProfileAddStep getNextStep(bool isCompany) {
    final values = ProfileAddStep.getValuesWith(isCompany);
    final lastIndex = values.length - 1;
    final currentIndex = values.indexOf(this);
    final nextIndex = currentIndex + 1;

    return values[min(nextIndex, lastIndex)];
  }

  ProfileAddStep getPrevStep(bool isCompany) {
    final values = ProfileAddStep.getValuesWith(isCompany);
    final firstIndex = 0;
    final currentIndex = values.indexOf(this);
    final prevIndex = currentIndex - 1;

    return values[max(prevIndex, firstIndex)];
  }

  String toTitle(bool isCompany) {
    switch (this) {
      case ProfileAddStep.introduction:
        return isCompany
            ? StringRes.companyIntroRegister.tr
            : StringRes.selfIntroRegister.tr;
      case ProfileAddStep.field:
        return isCompany
            ? StringRes.companyFieldSelect.tr
            : StringRes.selfFieldSelect.tr;
      case ProfileAddStep.career:
        return isCompany ? '' : StringRes.selfCareerInput.tr;
      case ProfileAddStep.portfolio:
        return isCompany
            ? StringRes.companyPortfolioAdd.tr
            : StringRes.selfPortfolioAdd.tr;
      case ProfileAddStep.area:
        return isCompany ? "" : StringRes.selfInterestAreaAdd.tr;
      case ProfileAddStep.profile:
        return isCompany
            ? StringRes.companyProfileRegister.tr
            : StringRes.selfProfileRegister.tr;
    }
  }

  String toDescription(bool isCompany) {
    switch (this) {
      case ProfileAddStep.introduction:
        return isCompany
            ? StringRes.companyIntroHint.tr
            : StringRes.selfIntroHint.tr;
      case ProfileAddStep.field:
        return isCompany
            ? StringRes.companyFieldDescription.tr
            : StringRes.selfFieldDescription.tr;
      case ProfileAddStep.career:
        return isCompany ? '' : StringRes.selfAchievementInfo.tr;
      case ProfileAddStep.portfolio:
        return isCompany
            ? StringRes.companyPortfolioPhotoGuide.tr
            : StringRes.selfPortfolioPhotoGuide.tr;
      case ProfileAddStep.area:
        return isCompany ? '' : StringRes.selfInterestAreaInfo.tr;
      case ProfileAddStep.profile:
        return isCompany
            ? StringRes.companyProfilePhotoUpload.tr
            : StringRes.selfProfilePhotoUpload.tr;
    }
  }
}
