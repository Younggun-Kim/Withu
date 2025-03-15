part of 'profile_add_bloc.dart';

abstract class ProfileAddEvent extends BaseBlocEvent {}

/// 다음 스탭으로 이동
class ProfileAddStepForwarded extends ProfileAddEvent {}

/// 이전 스탭으로 이동
class ProfileAddStepBackward extends ProfileAddEvent {}

/// 자기 소개 입력
class ProfileAddIntroductionInputted extends ProfileAddEvent {
  final String value;

  ProfileAddIntroductionInputted({required this.value});

  IntroductionValue get introduction => IntroductionValue(value);
}

/// 필드 선택
class ProfileAddFieldSelected extends ProfileAddEvent {
  final FieldType field;

  ProfileAddFieldSelected({required this.field});
}

/// 사진 추가 요청 이벤트
class ProfileAddPhotoAddRequested extends ProfileAddEvent {
  final ImageFileValue image;

  ProfileAddPhotoAddRequested({required this.image});
}

/// 사진 추가 요청 이벤트
class ProfileAddPhotoDeleted extends ProfileAddEvent {
  final ImageFileValue file;

  ProfileAddPhotoDeleted({required this.file});
}

/// 프로필 사진 클릭 이벤트
class ProfileAddProfilePhotoPressed extends ProfileAddEvent {
  final ImageFileValue image;

  ProfileAddProfilePhotoPressed({required this.image});
}

/// 경력 추가 클릭 이벤트
class ProfileAddCareerAppended extends ProfileAddEvent {}

/// 경력 삭제
class ProfileAddCareerDeleted extends ProfileAddEvent {
  final CareerEntity entity;

  ProfileAddCareerDeleted({required this.entity});
}

/// 경력 순서 변경
class ProfileAddCareerReordered extends ProfileAddEvent {
  final int oldIndex;
  final int newIndex;

  ProfileAddCareerReordered({required this.oldIndex, required this.newIndex});
}

/// 경력 입력 폼 접기
class ProfileAddCareerFormClosed extends ProfileAddEvent {}

/// 경력 선택
class ProfileAddCareerSelected extends ProfileAddEvent {
  final CareerEntity entity;

  ProfileAddCareerSelected({required this.entity});
}

/// 경력 이름 입력
class ProfileAddFormNameInputted extends ProfileAddEvent {
  final String value;

  ProfileAddFormNameInputted({required this.value});

  NameValue get name => NameValue(value);
}

/// 경력 내용 입력
class ProfileAddFormContentInputted extends ProfileAddEvent {
  final String value;

  ProfileAddFormContentInputted({required this.value});

  CareerContentValue get content => CareerContentValue(value);
}

/// 경력 회사 이름 입력
class ProfileAddFormCompanyInputted extends ProfileAddEvent {
  final String value;

  ProfileAddFormCompanyInputted({required this.value});

  CompanyNameValue get company => CompanyNameValue(value);
}

/// 경력 시작날짜 입력
class ProfileAddFormStartDateChanged extends ProfileAddEvent {
  final DateTime value;

  ProfileAddFormStartDateChanged({required this.value});

  CareerDateValue get date => CareerDateValue(value.format('yyyy/MM/dd'));
}

/// 경력 종료날짜 입력
class ProfileAddFormEndDateChanged extends ProfileAddEvent {
  final DateTime value;

  ProfileAddFormEndDateChanged({required this.value});

  CareerDateValue get date => CareerDateValue(value.format('yyyy/MM/dd'));
}

/// 지역 추가
class ProfileAddAreaAppend extends ProfileAddEvent {
  final AreaEntity area;

  ProfileAddAreaAppend({required this.area});
}

/// 지역 삭제
class ProfileAddAreaDeleted extends ProfileAddEvent {
  final AreaEntity area;

  ProfileAddAreaDeleted({required this.area});
}
