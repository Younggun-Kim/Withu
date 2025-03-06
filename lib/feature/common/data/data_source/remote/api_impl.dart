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
  FutureOr<ApiResponse<ValidateBusinessResDto>> postValidateBusiness(
    ValidateBusinessReqDto reqDto,
  ) {
    return network.dio
        .post('$path/validate-business', data: reqDto.toJson())
        .then(
          (response) => ApiResponse.success(
            ValidateBusinessResDto.fromJson(response.data),
          ),
        )
        .catchError(
          (_) => ApiResponse<ValidateBusinessResDto>.fail(FailResponse.error()),
        );
  }
}
