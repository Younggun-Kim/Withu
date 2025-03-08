part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends BaseBlocEvent {}

class SignUpRequestSent extends SignUpEvent {}

class SignUpRequestCompleted extends SignUpEvent {}

/// 이름 입력 입력
class SignUpNameInputted extends SignUpEvent {
  final String value;

  SignUpNameInputted({required this.value});

  NameValue get name => NameValue(value);
}

/// 생년월일 입력
class SignUpBirthDateInputted extends SignUpEvent {
  final BirthDateValue value;

  SignUpBirthDateInputted({required this.value});
}

/// 성별 선택
class SignUpGenderSelected extends SignUpEvent {
  final GenderType value;

  SignUpGenderSelected({required this.value});
}

/// 휴대폰 번호 입력
class SignUpPhoneNumInputted extends SignUpEvent {
  final PhoneValue value;

  SignUpPhoneNumInputted({required this.value});
}

/// 인증 여부 변경
class SignUpPhoneVerifyChanged extends SignUpEvent {
  final bool value;

  SignUpPhoneVerifyChanged({required this.value});
}

/// 이메일 입력
class SignUpEmailInputted extends SignUpEvent {
  final EmailValue value;

  SignUpEmailInputted({required this.value});
}

/// 비밀번호 입력
class SignUpPasswordInputted extends SignUpEvent {
  final String value;

  SignUpPasswordInputted({required this.value});

  PasswordValue get password => PasswordValue(value);
}

/// 채널 선택
class SignUpChannelSelected extends SignUpEvent {
  final ChannelType value;

  SignUpChannelSelected({required this.value});
}

/// 추천인 아이디 입력
class SignUpReferrerUserInputted extends SignUpEvent {
  final String value;

  SignUpReferrerUserInputted({required this.value});
}

/// 다음 버튼 클릭
class SignUpRequested extends SignUpEvent {}
