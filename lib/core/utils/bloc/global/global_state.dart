part of 'global_bloc.dart';

@freezed
class GlobalState extends BaseBlocState with _$GlobalState {
  factory GlobalState({
    /// 상태.
    required BaseBlocStatus status,

    /// 회원가입 화면에 전달할 Args
    @Default(SignUpArgsValue()) SignUpArgsValue signUpArgs,
  }) = _GlobalState;
}
