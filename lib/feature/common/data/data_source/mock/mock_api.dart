import 'dart:async';

import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:withu/core/network/dto/base/base_response_dto.dart';
import 'package:withu/feature/common/common.dart';

class CommonMockApi extends CommonApiImpl {
  CommonMockApi({required super.network}) {
    dioAdapter = DioAdapter(dio: network.dio);
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
      (server) => server.reply(
        400,
        ValidateBusinessResDtoMock.duplicate().toJson((_) => null),
        delay: const Duration(seconds: 1),
      ),
      data: reqDto.toJson(),
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
        SendAuthCodeResponseDtoMock.success().toJson(),
        delay: const Duration(seconds: 1),
      ),
      data: {phone: phone},
    );

    return await super.sendAuthCode(phone: phone);
  }

  /// 인증번호 검증
  @override
  FutureOr<BaseResponseDto<bool>> verifyAuthCode({
    required VerifyAuthCodeReqDto dto,
  }) async {
    /// Mock 응답 등록
    dioAdapter.onPost(
      CommonApiPathType.verifyAuthCode.fullPath,
      (server) => server.reply(
        200,
        BaseResponseDtoMock.success(true).toJson((value) => value),
        delay: const Duration(seconds: 1),
      ),
      data: dto.toJson(),
    );

    return await super.verifyAuthCode(dto: dto);
  }
}
