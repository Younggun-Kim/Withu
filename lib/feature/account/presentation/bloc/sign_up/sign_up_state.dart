part of 'sign_up_bloc.dart';

@freezed
class SignUpState extends BaseBlocState with _$SignUpState {
  factory SignUpState({
    required BaseBlocStatus status,

    @Default('') String message,

    /// 휴대폰
    @Default(Phone.empty) Phone phone,
  }) = _SignUpState;
}
