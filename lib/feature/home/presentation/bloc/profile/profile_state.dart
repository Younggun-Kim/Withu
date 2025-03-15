part of 'profile_bloc.dart';

@freezed
class ProfileState extends BaseBlocState with _$ProfileState {
  factory ProfileState({
    required BaseBlocStatus status,

    @Default('') String introduction,

    @Default(ProfileDetailEntity()) ProfileDetailEntity profile,
  }) = _ProfileState;
}
