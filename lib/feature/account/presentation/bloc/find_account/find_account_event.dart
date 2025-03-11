part of 'find_account_bloc.dart';

abstract class FindAccountEvent extends BaseBlocEvent {}

/// APi 요청 - 로딩 켜기
class FindAccountLoadingOn extends FindAccountEvent {}

/// API 요청 완료 - 로딩 끄기
class FindAccountLoadingOff extends FindAccountEvent {}

/// 이름 입력 입력
class FindAccountNameInputted extends FindAccountEvent {
  final String value;

  FindAccountNameInputted({required this.value});

  NameValue get name => NameValue(value);
}

/// 휴대폰 번호 입력
class FindAccountPhoneNumInputted extends FindAccountEvent {
  final PhoneValue value;

  FindAccountPhoneNumInputted({required this.value});
}

/// 인증 여부 변경
class FindAccountPhoneVerifyChanged extends FindAccountEvent {
  final bool value;

  FindAccountPhoneVerifyChanged({required this.value});
}

/// 이메일 입력
class FindAccountEmailInputted extends FindAccountEvent {
  final String value;

  FindAccountEmailInputted({required this.value});

  EmailValue get email => EmailValue(value);
}

/// 페이지 타입 변경
class FindAccountPageTypeChanged extends FindAccountEvent {
  final FindAccountPageType type;

  FindAccountPageTypeChanged({required this.type});
}

/// 아이디찾기 클릭
class FindAccountFindIdPressed extends FindAccountEvent {}

/// 비밀번호 찾기 클릭
class FindAccountFindPasswordPressed extends FindAccountEvent {}
