part of 'login_bloc.dart';

abstract class LoginEvent extends BaseBlocEvent {}

/// 메시지 초기화
class LoginMessageCleared extends LoginEvent {}

/// 아이디 입력 이벤트
class LoginIdInputted extends LoginEvent {
  LoginIdInputted({required this.value});
  final String value;

  LoginId get loginId => Email(value: value);
}

/// 비밀번호 입력 이벤트
class LoginPasswordInputted extends LoginEvent {
  LoginPasswordInputted({required this.value});
  final String value;

  PasswordValue get password => PasswordValue(value);
}

/// 로그인 버튼 클릭 이벤트
class LoginBtnPressed extends LoginEvent {
  LoginBtnPressed();
}

/// 탭 클릭 이벤트
class LoginTabPressed extends LoginEvent {
  LoginTabPressed({required this.type});
  final AccountType type;
}

/// 비밀번호 표시 토클 이벤트
class LoginVisiblePasswordToggled extends LoginEvent {
  LoginVisiblePasswordToggled();
}

/// 애플 로그인 요청
class LoginAppleRequested extends LoginEvent {}

/// 이메일 회원가입 클릭
class LoginEmailSignUpPressed extends LoginEvent {}
