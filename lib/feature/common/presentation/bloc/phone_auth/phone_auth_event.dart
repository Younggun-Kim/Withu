part of 'phone_auth_bloc.dart';

abstract class PhoneAuthEvent extends Equatable {}

/// 휴대폰 번호 입력 이벤트.
class PhoneAuthPhoneInputted extends PhoneAuthEvent {
  PhoneAuthPhoneInputted({required this.value});
  final String value;

  PhoneValue get phone => PhoneValue(value);

  @override
  List<Object?> get props => [value];
}

/// 인증 번호 요청 이벤트.
class PhoneAuthAuthCodeSent extends PhoneAuthEvent {
  @override
  List<Object?> get props => ['auth_code_sent'];
}

/// 인증번호 입력 이벤트.
class PhoneAuthAuthCodeInputted extends PhoneAuthEvent {
  PhoneAuthAuthCodeInputted({required this.value});
  final String value;

  AuthCodeValue get code => AuthCodeValue(value);

  @override
  List<Object?> get props => [];
}
