import 'dart:async';
import 'package:dio/dio.dart';
import 'package:withu/core/core.dart';
import 'package:withu/core/network/dto/base/fail_response_dto.dart';
import 'package:withu/feature/account/data/data_sources/dto/dto.dart';
import 'package:withu/feature/account/data/data_sources/dto/sns_sign_up/sns_sign_up.dart';
import 'api.dart';

class AccountApiImpl extends AccountApi {
  AccountApiImpl({required this.network});

  final DioNetwork network;

  @override
  FutureOr<RefreshResDto> refresh(String refreshToken) async {
    return network.dio
        .post(
          AccountApiPathType.refresh.fullPath,
          data: {'refreshToken': refreshToken},
        )
        .then(
          (response) => RefreshResDto.fromJson(
            response.data,
            (json) => RefreshResData.fromJson(json as Map<String, dynamic>),
          ),
        )
        .catchError(
          (error) => RefreshResDto.fromJson(
            error.response?.data,
            (json) => RefreshResData.fromJson(json as Map<String, dynamic>),
          ),
        )
        .catchError((_) => BaseResponseDtoMock.error<RefreshResData>());
  }

  /// 로그아웃
  @override
  FutureOr<BaseResponseDto<bool>> logout(String refreshToken) async {
    return network.dio
        .post(
          AccountApiPathType.logout.fullPath,
          data: {'refreshToken': refreshToken},
        )
        .then(
          (response) => BaseResponseDto<bool>.fromJson(
            response.data,
            (json) => json as bool,
          ),
        )
        .catchError(
          (error) => BaseResponseDto<bool>.fromJson(
            error.response?.data,
            (json) => json as bool,
          ),
        )
        .catchError((_) => BaseResponseDtoMock.error<bool>());
  }

  /// 로그인 API
  @override
  FutureOr<ApiResponse<LoginResponseDto>> login({
    required LoginRequestDto requestData,
  }) async {
    return network.dio
        .post(loginPath, data: requestData.toJson())
        .then(
          (response) =>
              ApiResponse.success(LoginResponseDto.fromJson(response.data)),
        )
        .catchError(
          (_) => ApiResponse<LoginResponseDto>.fail(FailResponse.error()),
        );
  }

  /// 이메일 로그인 API
  @override
  FutureOr<EmailLoginResDto> postEmailLogin({
    required EmailLoginReqData dto,
  }) async {
    return network.dio
        .post(AccountApiPathType.emailLogin.fullPath, data: dto.toJson())
        .then(
          (response) => EmailLoginResDto.fromJson(
            response.data,
            (json) => EmailLoginResData.fromJson(json as Map<String, dynamic>),
          ),
        )
        .catchError((error) {
          if (error is DioException) {
            return EmailLoginResDto.fromJson(
              error.response?.data,
              (json) =>
                  EmailLoginResData.fromJson(json as Map<String, dynamic>),
            );
          }

          return EmailLoginResDtoMock.error();
        })
        .catchError((_) {
          return EmailLoginResDtoMock.error();
        });
  }

  /// 회사 회원가입 요청
  @override
  FutureOr<CompanySignUpResDto> requestCompanySignUp({
    required CompanySignUpReqDto dto,
  }) async {
    return network.dio
        .post(AccountApiPathType.companySignUp.fullPath, data: dto.toJson())
        .then(
          (response) => CompanySignUpResDto.fromJson(
            response.data,
            (json) =>
                CompanySignUpResData.fromJson(json as Map<String, dynamic>),
          ),
        )
        .catchError((error) {
          if (error is DioException) {
            return CompanySignUpResDto.fromJson(
              error.response?.data,
              (json) =>
                  CompanySignUpResData.fromJson(json as Map<String, dynamic>),
            );
          }

          return BaseResponseDtoMock.error() as CompanySignUpResDto;
        });
  }

  /// 근로자 회원가입 요청
  @override
  FutureOr<UserSignUpResDto> requestUserSignUp({
    required UserSignUpReqDto dto,
  }) async {
    return network.dio
        .post(AccountApiPathType.userSignUp.fullPath, data: dto.toJson())
        .then(
          (response) => UserSignUpResDto.fromJson(
            response.data,
            (json) => UserSignUpResData.fromJson(json as Map<String, dynamic>),
          ),
        )
        .catchError((error) {
          if (error is DioException && error.response?.statusCode != 500) {
            return UserSignUpResDto.fromJson(
              error.response?.data,
              (json) =>
                  UserSignUpResData.fromJson(json as Map<String, dynamic>),
            );
          }

          return UserSignUpResDtoMock.error();
        });
  }

  /// 애플 로그인
  @override
  FutureOr<AppleLoginResDto> postAppleLogin({
    required AppleLoginReqDto dto,
  }) async {
    return network.dio
        .post(AccountApiPathType.appleLogin.fullPath, data: dto.toJson())
        .then(
          (response) => AppleLoginResDto.fromJson(
            response.data,
            (json) => AppleLoginResData.fromJson(json as Map<String, dynamic>),
          ),
        )
        .catchError((error) {
          logger.e(error);
          return AppleLoginResDto.fromJson(
            error.response?.data,
            (json) => AppleLoginResData.fromJson(json as Map<String, dynamic>),
          );
        })
        .catchError((_) => AppleLoginResDtoMock.error());
  }

  /// 아이디 찾기
  @override
  FutureOr<FindIdResDto> postFindId({required FindIdReqDto dto}) async {
    return network.dio
        .post(AccountApiPathType.findId.fullPath, data: dto.toJson())
        .then(
          (response) => FindIdResDto.fromJson(
            response.data,
            (json) => FindIdResData.fromJson(json as Map<String, dynamic>),
          ),
        )
        .catchError((error) {
          if (error is DioException && error.response?.statusCode != 500) {
            return FindIdResDto.fromJson(
              error.response?.data,
              (json) => FindIdResData.fromJson(json as Map<String, dynamic>),
            );
          }

          return BaseResponseDtoMock.error<FindIdResData>();
        })
        .catchError((_) => BaseResponseDtoMock.error<FindIdResData>());
  }

  /// 비밀번호 변경
  @override
  FutureOr<ChangePwResDto> postChangePw({required ChangePwReqDto dto}) async {
    return network.dio
        .post(AccountApiPathType.changePw.fullPath, data: dto.toJson())
        .then(
          (response) =>
              ChangePwResDto.fromJson(response.data, (json) => json as bool),
        )
        .catchError((error) {
          if (error is DioException && error.response?.statusCode != 500) {
            return ChangePwResDto.fromJson(
              error.response?.data,
              (json) => json as bool,
            );
          }

          return BaseResponseDtoMock.error<bool>();
        })
        .catchError((_) => BaseResponseDtoMock.error<bool>());
  }

  @override
  FutureOr<SnsSignUpResDto> postSnsSignUp({
    required SnsSignUpReqDto dto,
    required UserType userType,
  }) async {
    return network.dio
        .post(
          '${AccountApiPathType.snsSignUp.fullPath}?userType=${userType.serverKey}',
          data: dto.toJson(),
        )
        .then(
          (response) => SnsSignUpResDto.fromJson(
            response.data,
            (json) => SnsSignUpResData.fromJson(json as Map<String, dynamic>),
          ),
        )
        .catchError((error) {
          return SnsSignUpResDto.fromJson(
            error.response?.data,
            (json) => SnsSignUpResData.fromJson(json as Map<String, dynamic>),
          );
        })
        .catchError((_) => BaseResponseDtoMock.error<SnsSignUpResData>());
  }

  /// Staff 토큰 등록
  @override
  FutureOr<BaseResponseDto<bool>> postStaffTokenRegistration(
    TokenRegistrationReqDto dto,
  ) async {
    return network.dio
        .post(
          AccountApiPathType.registerStaffToken.fullPath,
          data: dto.toJson(),
        )
        .then(
          (response) =>
              BaseResponseDto.fromJson(response.data, (json) => json as bool),
        )
        .catchError(
          (error) => BaseResponseDto.fromJson(
            error?.response.data,
            (json) => json as bool,
          ),
        )
        .catchError((_) => BaseResponseDtoMock.error<bool>());
  }

  /// Company 토큰 등록
  @override
  FutureOr<BaseResponseDto<bool>> postCompanyTokenRegistration(
    TokenRegistrationReqDto dto,
  ) async {
    return network.dio
        .post(
          AccountApiPathType.registerCompanyToken.fullPath,
          data: dto.toJson(),
        )
        .then(
          (response) =>
              BaseResponseDto.fromJson(response.data, (json) => json as bool),
        )
        .catchError(
          (error) => BaseResponseDto.fromJson(
            error?.response.data,
            (json) => json as bool,
          ),
        )
        .catchError((_) => BaseResponseDtoMock.error<bool>());
  }

  /// 내 프로필 조회
  @override
  FutureOr<MyProfileResDto> getMyProfile() async {
    return network.dio
        .post(AccountApiPathType.getMyProfile.fullPath)
        .then(
          (response) => MyProfileResDto.fromJson(
            response.data,
            (json) => MyProfileResData.fromJson(json as Map<String, dynamic>),
          ),
        )
        .catchError(
          (error) => MyProfileResDto.fromJson(
            error.response?.data,
            (json) => MyProfileResData.fromJson(json as Map<String, dynamic>),
          ),
        )
        .catchError((_) => BaseResponseDtoMock.error<MyProfileResData>());
  }
}
