part of 'profile_bloc.dart';

@freezed
class ProfileState extends BaseBlocState with _$ProfileState {
  factory ProfileState({
    required BaseBlocStatus status,

    @Default('') String introduction,
  }) = _ProfileState;
}
