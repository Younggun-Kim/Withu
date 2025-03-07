part of 'api.dart';

class CommonApiImpl implements CommonApi {
  @override
  String get path => '/common';

  final DioNetwork network;

  CommonApiImpl({required this.network});

  /// 사업자등록 중복 검증
  @override
  FutureOr<ValidateBusinessResDto> postValidateBusiness(
    ValidateBusinessReqDto reqDto,
  ) {
    return network.dio
        .post(
          CommonApiPathType.validateBusiness.fullPath,
          data: reqDto.toJson(),
        )
        .then(
          (response) => BaseResponseDto.fromJson(
            response.data,
            (json) =>
                ValidateBusinessResData.fromJson(json as Map<String, dynamic>),
          ),
        )
        .catchError((error) {
          logger.e(error);
          if (error is DioException) {
            return ValidateBusinessResDto.fromJson(
              error.response?.data,
              (json) => ValidateBusinessResData.fromJson(
                json as Map<String, dynamic>,
              ),
            );
          }

          return BaseResponseDtoMock.error() as ValidateBusinessResDto;
        });
  }

  /// 인증번호 요청
  @override
  FutureOr<SendAuthCodeResponseDto> sendAuthCode({
    required String phone,
  }) async {
    return network.dio
        .post(CommonApiPathType.sendAuthCode.fullPath, data: {phone: phone})
        .then((response) => SendAuthCodeResponseDto.fromJson(response.data));
    // .catchError(
    //   (_) =>
    //       ApiResponse<SendAuthCodeResponseDto>.fail(FailResponse.error()),
    // );
  }

  /// 인증번호 검증
  @override
  FutureOr<BaseResponseDto<bool>> verifyAuthCode({
    required VerifyAuthCodeReqDto dto,
  }) async {
    return network.dio
        .post(CommonApiPathType.verifyAuthCode.fullPath, data: dto.toJson())
        .then(
          (response) =>
              BaseResponseDto.fromJson(response.data, (json) => json as bool),
        );
    // .catchError(
    //   (_) => ApiResponse<BaseResponseDto<bool>>.fail(FailResponse.error()),
    // );
  }
}
