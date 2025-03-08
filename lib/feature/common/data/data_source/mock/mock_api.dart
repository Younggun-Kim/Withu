import 'dart:async';

import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:withu/core/utils/injections.dart';
import 'package:withu/feature/common/common.dart';

class CommonMockApi extends CommonApiImpl {
  CommonMockApi({required super.network}) {
    dioAdapter = getIt();
  }

  late final DioAdapter dioAdapter;

  /// 사업자등록 중복 검증
  @override
  FutureOr<ValidateBusinessResDto> postValidateBusiness(
    ValidateBusinessReqDto reqDto,
  ) async {
    /// Mock 응답 등록
    dioAdapter.onPost(
      CommonApiPathType.validateBusiness.fullPath,
      data: reqDto.toJson(),
      (server) => server.reply(
        200,
        ValidateBusinessResDtoMock.success().toJson((data) => data.toJson()),
        delay: const Duration(seconds: 1),
      ),
    );

    return await super.postValidateBusiness(reqDto);
  }

  /// 인증번호 요청
  @override
  FutureOr<SendAuthCodeResponseDto> sendAuthCode({
    required String phone,
  }) async {
    /// Mock 응답 등록
    dioAdapter.onPost(
      CommonApiPathType.sendAuthCode.fullPath,
      (server) => server.reply(
        200,
        SendAuthCodeResponseDtoMock.success().toJson((data) => data.toJson()),
        delay: const Duration(seconds: 1),
      ),
      data: {'phoneNumber': phone},
    );

    return await super.sendAuthCode(phone: phone);
  }

  /// 인증번호 검증
  @override
  FutureOr<VerifyAuthCodeResDto> verifyAuthCode({
    required VerifyAuthCodeReqDto dto,
  }) async {
    /// Mock 응답 등록
    dioAdapter.onPost(
      CommonApiPathType.verifyAuthCode.fullPath,
      data: dto.toJson(),
      (server) => server.reply(
        200,
        VerifyAuthCodeResDtoMock.success().toJson((data) => data.toJson()),
        delay: const Duration(seconds: 1),
      ),
    );

    return await super.verifyAuthCode(dto: dto);
  }
}
