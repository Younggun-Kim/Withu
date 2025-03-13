import 'dart:async';
import 'package:withu/feature/common/common.dart';

class CommonRepositoryImpl implements CommonRepository {
  @override
  final CommonApi commonApi;

  CommonRepositoryImpl({required this.commonApi});

  @override
  Future<bool> checkBusinessNumDuplication(ValidateBusinessReqDto dto) async {
    final response = await commonApi.postValidateBusiness(dto);

    return response.canRegistration || true;
  }

  /// 휴대폰 인증번호 발송 요청
  @override
  FutureOr<SendAuthCodeResValue> postAuthCodeSend({
    required String phone,
  }) async {
    final response = await commonApi.sendAuthCode(phone: phone);
    final data = response.data;

    return data != null
        ? SendAuthCodeResValueParser.fromDto(data)
        : SendAuthCodeResValue.failure();
  }

  /// 인증번호 검증
  @override
  FutureOr<bool> postAuthCodeVerify({
    required String sessionId,
    required String authCode,
  }) async {
    final response = await commonApi.verifyAuthCode(
      dto: VerifyAuthCodeReqDto(sessionId: sessionId, code: authCode),
    );
    return response.data?.success == true;
  }
}
