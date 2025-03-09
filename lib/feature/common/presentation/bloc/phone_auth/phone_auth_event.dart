part of 'phone_auth_bloc.dart';

abstract class PhoneAuthEvent {}

class PhoneAuthInitialized extends PhoneAuthEvent {}

/// 휴대폰 번호 입력 이벤트.
class PhoneAuthPhoneInputted extends PhoneAuthEvent {
  PhoneAuthPhoneInputted({required this.value});

  final String value;

  PhoneValue get phone => PhoneValue(value);
}

/// 인증 번호 요청 이벤트.
class PhoneAuthAuthCodeSent extends PhoneAuthEvent {}

/// 인증번호 입력 이벤트.
class PhoneAuthAuthCodeInputted extends PhoneAuthEvent {
  PhoneAuthAuthCodeInputted({required this.value});

  final String value;

  AuthCodeValue get code => AuthCodeValue(value);
}

/// 인증 요청 이벤트.
class PhoneAuthVerifyRequested extends PhoneAuthEvent {}
