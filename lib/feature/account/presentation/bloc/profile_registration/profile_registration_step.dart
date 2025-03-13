import 'dart:math';

import 'package:withu/core/utils/resource/string_res.dart';

enum ProfileRegistrationStep {
  introduction(isOnlyStaff: false),
  field(isOnlyStaff: false),
  portfolio(isOnlyStaff: false),
  career(isOnlyStaff: true),
  area(isOnlyStaff: true),
  profile(isOnlyStaff: false);

  final bool isOnlyStaff;

  const ProfileRegistrationStep({required this.isOnlyStaff});

  static const ProfileRegistrationStep first = introduction;

  static List<ProfileRegistrationStep> getValuesWith(bool isCompany) {
    if (isCompany) {
      return ProfileRegistrationStep.getCompanySteps();
    } else {
      return ProfileRegistrationStep.values;
    }
  }

  static List<ProfileRegistrationStep> getCompanySteps() {
    return values.where((type) => !type.isOnlyStaff).toList();
  }
}

extension ProfileRegistrationStepEx on ProfileRegistrationStep {
  ProfileRegistrationStep getNextStep(bool isCompany) {
    final values = ProfileRegistrationStep.getValuesWith(isCompany);
    final lastIndex = values.length - 1;
    final currentIndex = values.indexOf(this);
    final nextIndex = currentIndex + 1;

    return values[min(nextIndex, lastIndex)];
  }

  String toTitle() {
    switch (this) {
      case ProfileRegistrationStep.introduction:
        return StringRes.selfIntroRegister.tr;
      case ProfileRegistrationStep.field:
        return StringRes.selfFieldSelect.tr;
      case ProfileRegistrationStep.career:
        return StringRes.selfCareerInput.tr;
      case ProfileRegistrationStep.portfolio:
        return StringRes.selfPortfolioAdd.tr;
      case ProfileRegistrationStep.area:
        return StringRes.selfInterestAreaAdd.tr;
      case ProfileRegistrationStep.profile:
        return StringRes.selfProfileRegister.tr;
    }
  }

  String toDescription() {
    switch (this) {
      case ProfileRegistrationStep.introduction:
        return StringRes.selfIntroHint.tr;
      case ProfileRegistrationStep.field:
        return StringRes.selfFieldDescription.tr;
      case ProfileRegistrationStep.career:
        return StringRes.selfAchievementInfo.tr;
      case ProfileRegistrationStep.portfolio:
        return StringRes.selfPortfolioPhotoGuide.tr;
      case ProfileRegistrationStep.area:
        return StringRes.selfInterestAreaInfo.tr;
      case ProfileRegistrationStep.profile:
        return StringRes.selfProfilePhotoUpload.tr;
    }
  }
}
