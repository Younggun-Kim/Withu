import 'dart:async';

import 'package:withu/core/core.dart';
import 'package:withu/feature/account/data/data.dart';
import 'package:withu/feature/account/data/data_sources/dto/sns_sign_up/sns_sign_up.dart';

abstract class AccountRepository {
  AccountRepository({required this.accountApi, required this.accountStorage});

  final AccountStorage accountStorage;

  final AccountApi accountApi;

  /// 로그아웃
  Future logout();

  /// 토큰 리프레시
  FutureOr<RefreshResDto> refreshToken();

  /// 이메일 로그인 토큰 요청
  FutureOr<LoginResDto> emailLogin({required EmailLoginReqData dto});

  /// 회사 회원가입 요청
  FutureOr<EmailSignUpResDto> requestCompanySignUp(EmailSignUpReqDto dto);

  /// 근로자 회원가입 요청
  FutureOr<EmailSignUpResDto> requestUserSignUp(EmailSignUpReqDto dto);

  /// 애플 로그인 요청
  FutureOr<AppleLoginResDto> requestAppleLogin(AppleLoginReqDto dto);

  /// 아이디 찾기 요청
  FutureOr<FindIdResDto> findId(String phone);

  /// 비밀번호 변경 요청
  /// return - (bool) 변경 성공 여부
  FutureOr<bool> changePw(ChangePwReqDto dto);

  /// SNS 회원가입 하기
  FutureOr<LoginResDto> postSnsSignUp(SnsSignUpReqDto dto, UserType userType);

  /// 내 정보 조회
  FutureOr<MyProfileResDto> getUserInfo();

  /// FCM 토큰 등록
  FutureOr<FcmRegistrationResDto> postFcmTokenRegistration({
    required UserType userType,
  });

  /// Profile 등록/수정
  FutureOr<ProfileDetailResDto> postProfileUpdate({
    required bool isCompany,
    required ProfileUpdateReqDto dto,
  });

  /// Profile 정보 얻기
  FutureOr<ProfileDetailResDto> getProfile(bool isCompany);

  /// Storage 관련
  void resetStoredData();

  /// Session Id Storage 에 조회
  Future<String> getToken();

  /// 토큰 저장
  void setToken(TokenListDto dto);
}
