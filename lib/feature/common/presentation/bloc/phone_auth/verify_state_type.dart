part of 'phone_auth_bloc.dart';

enum VerifyStateType {
  /// 인증번호 전송 전
  beforeSend,

  /// 인증번호 전송 실패
  sentFailure,

  /// 인증번호 전송 상태, 인증 요청 전
  beforeVerify,

  /// 인증 성공
  success,

  /// 인증 실패
  failure;

  static VerifyStateType getSentState(bool isAuthCodeSent) {
    return isAuthCodeSent ? beforeVerify : sentFailure;
  }

  static VerifyStateType getVerificationState(bool isVerified) {
    return isVerified ? success : failure;
  }
}

extension VerifyStateTypeEx on VerifyStateType {
  bool get isSentFailure => this == VerifyStateType.sentFailure;

  bool get isBeforeVerify => this == VerifyStateType.beforeVerify;

  bool get isSuccess => this == VerifyStateType.success;

  bool get isFailure => this == VerifyStateType.failure;
}
