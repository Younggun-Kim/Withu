import 'dart:async';
import 'package:dio/dio.dart';
import 'package:withu/core/core.dart';
import 'package:withu/core/network/dto/base/fail_response_dto.dart';
import 'package:withu/feature/account/data/data_sources/dto/dto.dart';
import 'api.dart';

class AccountApiImpl extends AccountApi {
  AccountApiImpl({required this.network});

  final DioNetwork network;

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
          if (error is DioException && error.response?.statusCode != 500) {
            return AppleLoginResDto.fromJson(
              error.response?.data,
              (json) =>
                  AppleLoginResData.fromJson(json as Map<String, dynamic>),
            );
          }

          return AppleLoginResDtoMock.error();
        })
        .catchError((_) => AppleLoginResDtoMock.error());
  }
}
