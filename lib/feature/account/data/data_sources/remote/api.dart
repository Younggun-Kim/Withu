import 'dart:async';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/data/data_sources/dto/dto.dart';

enum AccountApiPathType {
  changePw('/auth/recovery/enhanced-reset-password?userType=AUTO'),
  findId('/auth/recovery/find-account?userType=AUTO'),
  emailLogin('/auth/login'),
  companySignUp('/company/auth/signup'),
  userSignUp('/staff/auth/signup'),
  appleLogin('/auth/social/apple/verify');

  final String path;

  const AccountApiPathType(this.path);

  String get fullPath => '/api$path';
}

abstract class AccountApi {
  /// API 주소
  final path = '/api/account';

  /// 로그인 주소
  late final loginPath = '$path/login';

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
}
