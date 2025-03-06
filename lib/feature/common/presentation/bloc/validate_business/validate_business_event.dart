part of 'validate_business_bloc.dart';

abstract class ValidateBusinessEvent extends BaseBlocEvent {}

/// 메시지 초기화
class ValidateBusinessMessageCleared extends ValidateBusinessEvent {}

/// 사업자등록 입력
class ValidateBusinessNumInputted extends ValidateBusinessEvent {
  final BusinessNumValue value;

  ValidateBusinessNumInputted({required this.value});
}

/// 대표자명 입력
class ValidateCeoNameInputted extends ValidateBusinessEvent {
  final CeoNameValue value;

  ValidateCeoNameInputted({required this.value});
}

/// 회사명 입력
class ValidateCompanyNameInputted extends ValidateBusinessEvent {
  final CompanyNameValue value;

  ValidateCompanyNameInputted({required this.value});
}

/// 개업일자 입력
class ValidateOpenDateNameInputted extends ValidateBusinessEvent {
  final OpenDateValue value;

  ValidateOpenDateNameInputted({required this.value});
}
