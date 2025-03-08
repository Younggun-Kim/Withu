part of 'validate_business_bloc.dart';

abstract class ValidateBusinessEvent extends BaseBlocEvent {}

/// 메시지 초기화
class ValidateBusinessMessageCleared extends ValidateBusinessEvent {}

/// Args 저장
class ValidateBusinessArgsStored extends ValidateBusinessEvent {
  final ValidateBusinessPageArgs value;

  ValidateBusinessArgsStored({required this.value});
}

/// 사업자등록 입력
class ValidateBusinessNumInputted extends ValidateBusinessEvent {
  final BusinessNumValue value;

  ValidateBusinessNumInputted({required this.value});
}

/// 대표자명 입력
class ValidateBusinessCeoNameInputted extends ValidateBusinessEvent {
  final CeoNameValue value;

  ValidateBusinessCeoNameInputted({required this.value});
}

/// 회사명 입력
class ValidateBusinessCompanyNameInputted extends ValidateBusinessEvent {
  final CompanyNameValue value;

  ValidateBusinessCompanyNameInputted({required this.value});
}

/// 개업일자 입력
class ValidateBusinessOpenDateNameInputted extends ValidateBusinessEvent {
  final OpenDateValue value;

  ValidateBusinessOpenDateNameInputted({required this.value});
}

/// 중복확인 클릭
class ValidateBusinessCheckDuplicationPressed extends ValidateBusinessEvent {}
