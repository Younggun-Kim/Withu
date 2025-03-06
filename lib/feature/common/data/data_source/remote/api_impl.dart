part of 'api.dart';

class CommonApiImpl implements CommonApi {
  @override
  String get path => '/common';

  @override
  late Map<CommonApiPathType, String> paths = {
    CommonApiPathType.validateBusiness: '$path/validate-business',
  };

  final DioNetwork network;

  CommonApiImpl({required this.network});

  /// 사업자등록 중복 검증
  @override
  FutureOr<ValidateBusinessResDto> postValidateBusiness(
    ValidateBusinessReqDto reqDto,
  ) {
    return network.dio
        .post('$path/validate-business', data: reqDto.toJson())
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
}
