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
  final ImageFileValue file;

  ProfileAddPhotoAddRequested({required this.file});
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
