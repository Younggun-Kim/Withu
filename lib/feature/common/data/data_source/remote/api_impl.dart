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
        .post(
          CommonApiPathType.sendAuthCode.fullPath,
          data: {"phoneNumber": phone},
        )
        .then(
          (response) => SendAuthCodeResponseDto.fromJson(
            response.data,
            (json) =>
                SendAuthCodeResponseData.fromJson(json as Map<String, dynamic>),
          ),
        )
        .catchError((error) {
          return SendAuthCodeResponseDtoMock.failure();
        });
  }

  /// 인증번호 검증
  @override
  FutureOr<VerifyAuthCodeResDto> verifyAuthCode({
    required VerifyAuthCodeReqDto dto,
  }) async {
    return network.dio
        .post(CommonApiPathType.verifyAuthCode.fullPath, data: dto.toJson())
        .then(
          (response) => VerifyAuthCodeResDto.fromJson(
            response.data,
            (json) =>
                VerifyAuthCodeResData.fromJson(json as Map<String, dynamic>),
          ),
        )
        .catchError((error) {
          return VerifyAuthCodeResDtoMock.failure();
        });
  }

  /// 시/도 조회
  @override
  FutureOr<AreaResDto> getSigo() async {
    return network.dio
        .get(CommonApiPathType.sido.fullPath)
        .then(
          (response) => AreaResDto.fromJson(
            response.data,
            (json) =>
                (json as List<dynamic>) // `data`는 List 형태로 변환
                    .map((e) => AreaResData.fromJson(e as Map<String, dynamic>))
                    .toList(),
          ),
        )
        .catchError(
          (error) => AreaResDto.fromJson(
            error.response?.data,
            (json) =>
                (json as List<dynamic>) // `data`는 List 형태로 변환
                    .map((e) => AreaResData.fromJson(e as Map<String, dynamic>))
                    .toList(),
          ),
        )
        .catchError((_) => BaseResponseDtoMock.error<List<AreaResData>>());
  }

  /// 시/군/구 조회
  @override
  FutureOr<AreaResDto> getSgg(String sidoCode) async {
    return network.dio
        .get('${CommonApiPathType.sgg.fullPath}?sidoCode=$sidoCode')
        .then(
          (response) => AreaResDto.fromJson(
            response.data,
            (json) =>
                (json as List<dynamic>) // `data`는 List 형태로 변환
                    .map((e) => AreaResData.fromJson(e as Map<String, dynamic>))
                    .toList(),
          ),
        )
        .catchError(
          (error) => AreaResDto.fromJson(
            error.response?.data,
            (json) =>
                (json as List<dynamic>) // `data`는 List 형태로 변환
                    .map((e) => AreaResData.fromJson(e as Map<String, dynamic>))
                    .toList(),
          ),
        )
        .catchError((_) => BaseResponseDtoMock.error<List<AreaResData>>());
  }

  /// 읍/면/동 조회
  @override
  FutureOr<AreaResDto> getEmd(String sggCode) async {
    return network.dio
        .get('${CommonApiPathType.emd.fullPath}?sggCode=$sggCode')
        .then(
          (response) => AreaResDto.fromJson(
            response.data,
            (json) =>
                (json as List<dynamic>) // `data`는 List 형태로 변환
                    .map((e) => AreaResData.fromJson(e as Map<String, dynamic>))
                    .toList(),
          ),
        )
        .catchError(
          (error) => AreaResDto.fromJson(
            error.response?.data,
            (json) =>
                (json as List<dynamic>) // `data`는 List 형태로 변환
                    .map((e) => AreaResData.fromJson(e as Map<String, dynamic>))
                    .toList(),
          ),
        )
        .catchError((_) => BaseResponseDtoMock.error<List<AreaResData>>());
  }
}
