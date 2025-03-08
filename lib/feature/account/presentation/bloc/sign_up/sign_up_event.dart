part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends BaseBlocEvent {}

class SignUpRequestSent extends SignUpEvent {}

class SignUpRequestCompleted extends SignUpEvent {}

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
