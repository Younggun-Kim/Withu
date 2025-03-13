import 'dart:async';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/account/data/data_sources/dto/sns_sign_up/sns_sign_up.dart';

class AccountMockApi extends AccountApiImpl {
  late final DioAdapter dioAdapter;

  AccountMockApi({required super.network}) {
    dioAdapter = getIt();
  }

  /// Refresh Token
  @override
  FutureOr<RefreshResDto> refresh(String refreshToken) async {
    /// Mock 응답 등록
    dioAdapter.onPost(
      AccountApiPathType.refresh.fullPath,
      data: {'refreshToken': refreshToken},
      (server) => server.reply(
        200,
        RefreshResDtoMock.success().toJson((data) => data.toJson()),
        delay: const Duration(seconds: 1),
      ),
    );

    return await super.refresh(refreshToken);
  }

  /// Logout
  @override
  FutureOr<BaseResponseDto<bool>> logout(String refreshToken) async {
    /// Mock 응답 등록
    dioAdapter.onPost(
      AccountApiPathType.logout.fullPath,
      data: {'refreshToken': refreshToken},
      (server) => server.reply(
        200,
        BaseResponseDto<bool>(
          data: true,
          success: true,
          message: '로그아웃 성공',
        ).toJson((data) => data),
        delay: const Duration(seconds: 1),
      ),
    );

    return await super.logout(refreshToken);
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

  /// 아이디 찾기
  @override
  FutureOr<FindIdResDto> postFindId({required FindIdReqDto dto}) async {
    /// Mock 응답 등록
    dioAdapter.onPost(
      AccountApiPathType.findId.fullPath,
      data: dto.toJson(),
      (server) => server.reply(
        200,
        AppleLoginResDtoMock.success().toJson((data) => data.toJson()),
        delay: const Duration(seconds: 1),
      ),
    );

    return await super.postFindId(dto: dto);
  }

  /// 비밀번호 변경
  @override
  FutureOr<ChangePwResDto> postChangePw({required ChangePwReqDto dto}) async {
    /// Mock 응답 등록
    dioAdapter.onPost(
      AccountApiPathType.changePw.fullPath,
      data: dto.toJson(),
      (server) => server.reply(
        200,
        ChangePwResDtoMock.failure().toJson((data) => data),
        delay: const Duration(seconds: 1),
      ),
    );

    return await super.postChangePw(dto: dto);
  }

  @override
  FutureOr<SnsSignUpResDto> postSnsSignUp({
    required SnsSignUpReqDto dto,
    required UserType userType,
  }) async {
    /// Mock 응답 등록
    dioAdapter.onPost(
      '${AccountApiPathType.snsSignUp.fullPath}?userType=${userType.serverKey}',
      data: dto.toJson(),
      (server) => server.reply(
        200,
        SnsSignUpResDtoMock.success().toJson((data) => data.toJson()),
        delay: const Duration(seconds: 1),
      ),
    );

    return await super.postSnsSignUp(dto: dto, userType: userType);
  }

  /// Staff 토큰 등록
  @override
  FutureOr<BaseResponseDto<bool>> postStaffTokenRegistration(
    TokenRegistrationReqDto dto,
  ) async {
    /// Mock 응답 등록
    dioAdapter.onPost(
      AccountApiPathType.registerStaffToken.fullPath,
      data: dto.toJson(),
      (server) => server.reply(
        200,
        BaseResponseDtoMock.success(true).toJson((data) => data),
        delay: const Duration(seconds: 1),
      ),
    );

    return await super.postStaffTokenRegistration(dto);
  }

  /// Company 토큰 등록
  @override
  FutureOr<BaseResponseDto<bool>> postCompanyTokenRegistration(
    TokenRegistrationReqDto dto,
  ) async {
    /// Mock 응답 등록
    dioAdapter.onPost(
      AccountApiPathType.registerStaffToken.fullPath,
      data: dto.toJson(),
      (server) => server.reply(
        200,
        BaseResponseDtoMock.success(true).toJson((data) => data),
        delay: const Duration(seconds: 1),
      ),
    );

    return await super.postCompanyTokenRegistration(dto);
  }

  /// 내 프로필 조회
  @override
  FutureOr<MyProfileResDto> getMyProfile() async {
    /// Mock 응답 등록
    dioAdapter.onPost(
      AccountApiPathType.getMyProfile.fullPath,
      (server) => server.reply(
        200,
        MyProfileResDtoMock.success().toJson((data) => data.toJson()),
        delay: const Duration(seconds: 1),
      ),
    );

    return await super.getMyProfile();
  }
}
