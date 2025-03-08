part of 'phone_auth_bloc.dart';

@freezed
class PhoneAuthState extends BaseBlocState with _$PhoneAuthState {
  factory PhoneAuthState({
    required BaseBlocStatus status,

    /// 휴대폰
    @Default(PhoneValue()) PhoneValue phone,

    /// 인증번호 전송 성공 여부
    @Default(false) bool isSuccessSend,

    /// sessionId
    @Default('') String sessionId,

    /// 인증번호
    @Default(AuthCodeValue()) AuthCodeValue authCode,

    /// 인증 상태
    @Default(VerifyStateType.beforeSend) VerifyStateType verifyState,
  }) = _PhoneAuthState;
}

extension PhoneAuthStateExt on PhoneAuthState {
  /// 인증번호 검증 요청 가능 여부
  bool get canAuthCodeVerification => phone.isValid() && authCode.isValid();

  /// 인증 요청 가능 여부
  bool get canRequestVerification => phone.isValid();
}
