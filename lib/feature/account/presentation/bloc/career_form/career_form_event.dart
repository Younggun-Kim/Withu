part of 'career_form_bloc.dart';

abstract class CareerFormEvent extends BaseBlocEvent {}

/// 초기화
class CareerFormInitialized extends CareerFormEvent {
  final CareerEntity entity;

  CareerFormInitialized({required this.entity});
}

/// 경력 이름 입력
class CareerFormNameInputted extends CareerFormEvent {
  final String value;

  CareerFormNameInputted({required this.value});

  NameValue get name => NameValue(value);
}

/// 경력 내용 입력
class CareerFormContentInputted extends CareerFormEvent {
  final String value;

  CareerFormContentInputted({required this.value});

  CareerContentValue get content => CareerContentValue(value);
}

/// 경력 회사 이름 입력
class CareerFormCompanyInputted extends CareerFormEvent {
  final String value;

  CareerFormCompanyInputted({required this.value});

  CompanyNameValue get company => CompanyNameValue(value);
}

/// 경력 시작날짜 입력
class CareerFormStartDateChanged extends CareerFormEvent {
  final DateTime value;

  CareerFormStartDateChanged({required this.value});

  CareerDateValue get date => CareerDateValue(value.format('yyyy-MM-dd'));
}

/// 경력 종료날짜 입력
class CareerFormEndDateChanged extends CareerFormEvent {
  final DateTime value;

  CareerFormEndDateChanged({required this.value});

  CareerDateValue get date => CareerDateValue(value.format('yyyy-MM-dd'));
}

/// 경력 슈정하기
class CareerFormUpdated extends CareerFormEvent {}

/// 경력 삭제하기
class CareerFormDeleted extends CareerFormEvent {}
