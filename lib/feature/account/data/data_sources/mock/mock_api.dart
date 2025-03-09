import 'dart:async';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';

class AccountMockApi extends AccountApiImpl {
  late final DioAdapter dioAdapter;

  AccountMockApi({required super.network}) {
    dioAdapter = getIt();
  }

  /// 로그인 API
  @override
  FutureOr<ApiResponse<LoginResponseDto>> login({
    required LoginRequestDto requestData,
  }) async {
    /// Mock 응답 등록
    dioAdapter.onPost(
      loginPath,
      data: requestData.toJson(),
      (server) => server.reply(
        200,
        LoginResponseDtoMock.success().toJson(),
        delay: const Duration(seconds: 1),
      ),
    );

    return await super.login(requestData: requestData);
  }

  /// 이메일 로그인 API
  @override
  FutureOr<EmailLoginResDto> postEmailLogin({
    required EmailLoginReqData dto,
  }) async {
    /// Mock 응답 등록
    dioAdapter.onPost(
      AccountApiPathType.emailLogin.fullPath,
      data: dto.toJson(),
      (server) => server.reply(
        200,
        EmailLoginResDtoMock.success().toJson((data) => data.toJson()),
        delay: const Duration(seconds: 1),
      ),
    );

    return await super.postEmailLogin(dto: dto);
  }

  /// 회원가입 API
  @override
  FutureOr<CompanySignUpResDto> requestCompanySignUp({
    required CompanySignUpReqDto dto,
  }) async {
    /// Mock 응답 등록
    dioAdapter.onPost(
      AccountApiPathType.companySignUp.fullPath,
      data: dto.toJson(),
      (server) => server.reply(
        200,
        CompanySignUpResDtoMock.success().toJson((data) => data.toJson()),
        delay: const Duration(seconds: 1),
      ),
    );

    return await super.requestCompanySignUp(dto: dto);
  }

  /// 근로자 회원가입 API
  @override
  FutureOr<UserSignUpResDto> requestUserSignUp({
    required UserSignUpReqDto dto,
  }) async {
    /// Mock 응답 등록
    dioAdapter.onPost(
      AccountApiPathType.userSignUp.fullPath,
      data: dto.toJson(),
      (server) => server.reply(
        200,
        UserSignUpResDtoMock.success().toJson((data) => data.toJson()),
        delay: const Duration(seconds: 1),
      ),
    );

    return await super.requestUserSignUp(dto: dto);
  }

  /// 애플 로그인
  @override
  FutureOr<AppleLoginResDto> postAppleLogin({
    required AppleLoginReqDto dto,
  }) async {
    /// Mock 응답 등록
    dioAdapter.onPost(
      AccountApiPathType.appleLogin.fullPath,
      data: dto.toJson(),
      (server) => server.reply(
        200,
        AppleLoginResDtoMock.success().toJson((data) => data.toJson()),
        delay: const Duration(seconds: 1),
      ),
    );

    return await super.postAppleLogin(dto: dto);
  }
}
