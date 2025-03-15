import 'dart:async';

import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:withu/core/utils/library/get_it/get_it_utils.dart';
import 'package:withu/feature/common/common.dart';
import 'package:withu/feature/common/data/data_source/dto/area/area_res_dto.dart';

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

  /// 시/도 조회
  @override
  FutureOr<AreaResDto> getSigo() async {
    /// Mock 응답 등록
    dioAdapter.onGet(
      CommonApiPathType.sido.fullPath,
      (server) => server.reply(
        200,
        AreaResDtoMock.sido().toJson(
          (data) => data.map((e) => e.toJson()).toList(),
        ),
        delay: const Duration(seconds: 1),
      ),
    );

    return await super.getSigo();
  }

  /// 시/군/구 조회
  @override
  FutureOr<AreaResDto> getSgg(String sidoCode) async {
    /// Mock 응답 등록
    dioAdapter.onGet(
      CommonApiPathType.sgg.fullPath,
      queryParameters: {"sidoCode": sidoCode},
      (server) => server.reply(
        200,
        AreaResDtoMock.sgg().toJson(
          (data) => data.map((e) => e.toJson()).toList(),
        ),
        delay: const Duration(seconds: 1),
      ),
    );

    return await super.getSgg(sidoCode);
  }

  /// 읍/면/동 조회
  @override
  FutureOr<AreaResDto> getEmd(String sggCode) async {
    /// Mock 응답 등록
    dioAdapter.onGet(
      CommonApiPathType.emd.fullPath,
      queryParameters: {'sggCode': sggCode},
      (server) => server.reply(
        200,
        AreaResDtoMock.emd().toJson(
          (data) => data.map((e) => e.toJson()).toList(),
        ),
        delay: const Duration(seconds: 1),
      ),
    );

    return await super.getEmd(sggCode);
  }

  /// 단일 이미지 업로드
  @override
  FutureOr<SingleImageResDto> postSingleImageUpload(
    SingleImageReqDto dto,
  ) async {
    /// Mock 응답 등록
    dioAdapter.onPost(
      CommonApiPathType.uploadSingleImage.fullPath,
      data: dto.toFormData(),
      (server) => server.reply(
        200,
        SingleImageResDtoMock.empty().toJson((data) => data),
        delay: const Duration(seconds: 1),
      ),
    );

    return await super.postSingleImageUpload(dto);
  }

  /// 여러 이미지 업로드
  @override
  FutureOr<MultiImageResDto> postMultiImageUpload(MultiImageReqDto dto) async {
    /// Mock 응답 등록
    dioAdapter.onPost(
      CommonApiPathType.uploadMultiImage.fullPath,
      data: dto.toFormData(),
      (server) => server.reply(
        200,
        MultiImageResDtoMock.empty().toJson((data) => data),
        delay: const Duration(seconds: 1),
      ),
    );

    return await super.postMultiImageUpload(dto);
  }
}
