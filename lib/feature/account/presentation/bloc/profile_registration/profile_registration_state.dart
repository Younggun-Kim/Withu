part of 'profile_registration_bloc.dart';

@freezed
class ProfileRegistrationState extends BaseBlocState
    with _$ProfileRegistrationState {
  factory ProfileRegistrationState({
    required BaseBlocStatus status,

    @Default('') String introduction,
  }) = _ProfileRegistrationState;
}
