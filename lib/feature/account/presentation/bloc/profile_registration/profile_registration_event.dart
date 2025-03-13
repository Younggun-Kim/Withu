part of 'profile_registration_bloc.dart';

abstract class ProfileRegistrationEvent extends BaseBlocEvent {}

/// 다음 스탭으로 이동
class ProfileRegistrationStepForwarded extends ProfileRegistrationEvent {}

/// 자기 소개 입력
class ProfileRegistrationIntroductionInputted extends ProfileRegistrationEvent {
  final String value;

  ProfileRegistrationIntroductionInputted({required this.value});

  IntroductionValue get introduction => IntroductionValue(value);
}
