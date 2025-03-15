part of 'profile_bloc.dart';

abstract class ProfileEvent extends BaseBlocEvent {}

/// 초기화
class ProfileInitialized extends ProfileEvent {}

/// 정보 등록하기 버튼 클릭
class ProfileRegistrationBtnPressed extends ProfileEvent {}
