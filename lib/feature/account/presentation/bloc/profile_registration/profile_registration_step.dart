import 'dart:math';

enum ProfileRegistrationStep {
  introduction(isOnlyStaff: false),
  field(isOnlyStaff: false),
  portfolio(isOnlyStaff: false),
  area(isOnlyStaff: true),
  profile(isOnlyStaff: false);

  final bool isOnlyStaff;

  const ProfileRegistrationStep({required this.isOnlyStaff});

  List<ProfileRegistrationStep> getCompanySteps() {
    return values.where((type) => !type.isOnlyStaff).toList();
  }

  static const ProfileRegistrationStep first = introduction;
}

extension ProfileRegistrationStepEx on ProfileRegistrationStep {
  ProfileRegistrationStep getNextStep() {
    final lastIndex = ProfileRegistrationStep.values.length - 1;
    final currentIndex = ProfileRegistrationStep.values.indexOf(this);

    return ProfileRegistrationStep.values[min(currentIndex, lastIndex)];
  }
}
