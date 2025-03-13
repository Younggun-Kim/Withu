import 'dart:async';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/data/data_sources/dto/dto.dart';
import 'package:withu/feature/account/data/data_sources/dto/sns_sign_up/sns_sign_up.dart';

enum AccountApiPathType {
  getMyProfile('/auth/me/profile'),
  registerStaffToken('/staff/device-tokens'),
  registerCompanyToken('/company/device-tokens'),
  refresh('/auth/refresh'),
  logout('/auth/logout'),
  changePw('/auth/recovery/enhanced-reset-password?userType=AUTO'),
  findId('/auth/recovery/find-account?userType=AUTO'),
  emailLogin('/auth/login'),
  companySignUp('/company/auth/signup'),
  userSignUp('/staff/auth/signup'),
  appleLogin('/auth/social/apple/verify'),
  snsSignUp('/auth/social/complete-signup');

  final String path;

  const AccountApiPathType(this.path);

  String get fullPath => '/api$path';
}

abstract class AccountApi {
  /// API 주소
  final path = '/api/account';

  /// 로그인 주소
  late final loginPath = '$path/login';

  /// 리프레시
  FutureOr<RefreshResDto> refresh(String refreshToken);

  /// 로그아웃
  FutureOr<BaseResponseDto<bool>> logout(String refreshToken);

  /// 로그인 API
  FutureOr<ApiResponse<LoginResponseDto>> login({
    required LoginRequestDto requestData,
  });

  /// 로그인 API
  FutureOr<EmailLoginResDto> postEmailLogin({required EmailLoginReqData dto});

  /// 회사 회원가입 요청
  FutureOr<CompanySignUpResDto> requestCompanySignUp({
    required CompanySignUpReqDto dto,
  });

  /// 근로자 회원가입 요청
  FutureOr<UserSignUpResDto> requestUserSignUp({required UserSignUpReqDto dto});

  /// 애플 로그인
  FutureOr<AppleLoginResDto> postAppleLogin({required AppleLoginReqDto dto});

  /// 아이디 찾기
  FutureOr<FindIdResDto> postFindId({required FindIdReqDto dto});

  /// 비밀번호 변경
  FutureOr<ChangePwResDto> postChangePw({required ChangePwReqDto dto});

  /// SnS 회원가입
  FutureOr<SnsSignUpResDto> postSnsSignUp({
    required SnsSignUpReqDto dto,
    required UserType userType,
  });

  /// Staff 토큰 등록
  FutureOr<BaseResponseDto<bool>> postStaffTokenRegistration(
    TokenRegistrationReqDto dto,
  );

  /// Company 토큰 등록
  FutureOr<BaseResponseDto<bool>> postCompanyTokenRegistration(
    TokenRegistrationReqDto dto,
  );

  /// 내 프로필 조회
  FutureOr<MyProfileResDto> getMyProfile();
}
