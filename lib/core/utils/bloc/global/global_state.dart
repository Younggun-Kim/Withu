part of 'global_bloc.dart';

@freezed
class GlobalState extends BaseBlocState with _$GlobalState {
  factory GlobalState({
    /// 상태.
    required BaseBlocStatus status,

    /// 회원가입 화면에 전달할 Args
    @Default(SignUpArgsValue()) SignUpArgsValue signUpArgs,

    /// 회원 타입
    MyProfileEntity? profileInfo,
  }) = _GlobalState;
}

extension GlobalStateEx on GlobalState {
  bool get isCompanyUser => profileInfo?.userType.iSCompany == false;
}
