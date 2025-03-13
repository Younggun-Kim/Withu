part of 'profile_registration_bloc.dart';

abstract class ProfileRegistrationEvent extends BaseBlocEvent {}

/// 다음 스탭으로 이동
class ProfileRegistrationStepForwarded extends ProfileRegistrationEvent {}
