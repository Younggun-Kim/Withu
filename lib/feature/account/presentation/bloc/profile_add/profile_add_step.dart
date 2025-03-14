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

  String toTitle() {
    switch (this) {
      case ProfileAddStep.introduction:
        return StringRes.selfIntroRegister.tr;
      case ProfileAddStep.field:
        return StringRes.selfFieldSelect.tr;
      case ProfileAddStep.career:
        return StringRes.selfCareerInput.tr;
      case ProfileAddStep.portfolio:
        return StringRes.selfPortfolioAdd.tr;
      case ProfileAddStep.area:
        return StringRes.selfInterestAreaAdd.tr;
      case ProfileAddStep.profile:
        return StringRes.selfProfileRegister.tr;
    }
  }

  String toDescription() {
    switch (this) {
      case ProfileAddStep.introduction:
        return StringRes.selfIntroHint.tr;
      case ProfileAddStep.field:
        return StringRes.selfFieldDescription.tr;
      case ProfileAddStep.career:
        return StringRes.selfAchievementInfo.tr;
      case ProfileAddStep.portfolio:
        return StringRes.selfPortfolioPhotoGuide.tr;
      case ProfileAddStep.area:
        return StringRes.selfInterestAreaInfo.tr;
      case ProfileAddStep.profile:
        return StringRes.selfProfilePhotoUpload.tr;
    }
  }
}
