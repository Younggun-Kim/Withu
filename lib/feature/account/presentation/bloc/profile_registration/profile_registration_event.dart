part of 'profile_registration_bloc.dart';

abstract class ProfileRegistrationEvent extends BaseBlocEvent {}

/// 다음 스탭으로 이동
class ProfileRegistrationStepForwarded extends ProfileRegistrationEvent {}

/// 자기 소개 입력
class ProfileRegistrationIntroductionInputted extends ProfileRegistrationEvent {
  final String value;

  ProfileRegistrationIntroductionInputted({required this.value});

  IntroductionValue get introduction => IntroductionValue(value);
}

/// 필드 선택
class ProfileRegistrationFieldSelected extends ProfileRegistrationEvent {
  final FieldType field;

  ProfileRegistrationFieldSelected({required this.field});
}

/// 사진 추가 요청 이벤트
class ProfileRegistrationAddPhotoRequested extends ProfileRegistrationEvent {
  final ImageFileValue file;

  ProfileRegistrationAddPhotoRequested({required this.file});
}

/// 사진 추가 요청 이벤트
class ProfileRegistrationPhotoDeleted extends ProfileRegistrationEvent {
  final ImageFileValue file;

  ProfileRegistrationPhotoDeleted({required this.file});
}
