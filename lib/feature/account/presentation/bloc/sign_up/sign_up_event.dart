part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends BaseBlocEvent {}

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
