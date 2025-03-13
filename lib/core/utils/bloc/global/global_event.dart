part of 'global_bloc.dart';

sealed class GlobalEvent extends BaseBlocEvent {}

/// 회원가입 Args 저장
class GlobalSignUpArgsStored extends GlobalEvent {
  final SignUpArgsValue args;

  GlobalSignUpArgsStored({required this.args});
}

/// 프로필 정보 저장
class GlobalUserInfoStored extends GlobalEvent {
  final MyProfileEntity profileInfo;

  GlobalUserInfoStored({required this.profileInfo});
}
