import 'dart:async';
import 'package:withu/feature/common/common.dart';
import 'package:withu/feature/common/data/data_source/dto/area/area_res_dto.dart';

class CommonRepositoryImpl implements CommonRepository {
  @override
  final CommonApi commonApi;

  CommonRepositoryImpl({required this.commonApi});

  @override
  Future<bool> checkBusinessNumDuplication(ValidateBusinessReqDto dto) async {
    final response = await commonApi.postValidateBusiness(dto);

    return response.canRegistration;
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

  /// 시/도 조회
  @override
  FutureOr<AreaResDto> getSido() async {
    return await commonApi.getSigo();
  }

  /// 시/군/구 조회
  @override
  FutureOr<AreaResDto> getSgg(String sidoCode) async {
    return await commonApi.getSgg(sidoCode);
  }

  /// 읍/면/동 조회
  @override
  FutureOr<AreaResDto> getEmd(String sggCode) async {
    return await commonApi.getEmd(sggCode);
  }
}
