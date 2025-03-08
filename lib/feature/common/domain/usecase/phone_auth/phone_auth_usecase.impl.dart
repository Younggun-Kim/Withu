part of 'phone_auth_usecase.dart';

class PhoneAuthUseCaseImpl implements PhoneAuthUseCase {
  @override
  final CommonRepository commonRepo;

  PhoneAuthUseCaseImpl({required this.commonRepo});

  /// 휴대폰 인증번호 발송 요청
  @override
  Future<SendAuthCodeResValue> sendAuthCode({required String phone}) async {
    return await commonRepo.postAuthCodeSend(phone: phone);
  }

  /// 인증번호 검증
  @override
  Future<bool> verifyAuthCode({
    required String sessionId,
    required AuthCodeValue authCode,
  }) async {
    return await commonRepo.postAuthCodeVerify(
      sessionId: sessionId,
      authCode: authCode.value,
    );
  }
}
