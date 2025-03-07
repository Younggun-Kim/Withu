import 'dart:async';
import 'package:withu/feature/common/common.dart';

class CommonRepositoryImpl implements CommonRepository {
  @override
  final CommonApi commonApi;

  CommonRepositoryImpl({required this.commonApi});

  @override
  Future<bool> checkBusinessNumDuplication(ValidateBusinessReqDto dto) async {
    final response = await commonApi.postValidateBusiness(dto);

    return response.isDuplicated;
  }

  /// 휴대폰 인증번호 발송 요청
  @override
  FutureOr<bool> postAuthCodeSend({required String phone}) async {
    final response = await commonApi.sendAuthCode(phone: phone);

    return response.status;
  }

  /// 인증번호 검증
  @override
  FutureOr<bool> postAuthCodeVerify({
    required String phone,
    required String authCode,
  }) async {
    final response = await commonApi.verifyAuthCode(
      dto: VerifyAuthCodeReqDto(phone: phone, authCode: authCode),
    );
    return response.data == true;
  }
}
