part of 'change_pw_bloc.dart';

abstract class ChangePwEvent extends BaseBlocEvent {}

/// Arguments 저장
class ChangePwArgsStored extends ChangePwEvent {
  final ChangePwPageArgs args;

  ChangePwArgsStored({required this.args});
}

/// 비밀번호 입력
class ChangePwInputted extends ChangePwEvent {
  final String value;

  ChangePwInputted({required this.value});

  PasswordValue get password => PasswordValue(value);
}

/// 비밀번호 변경 요청
class ChangePwRequested extends ChangePwEvent {}
