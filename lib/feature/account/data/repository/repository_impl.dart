import 'dart:async';

import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/account/data/data_sources/dto/sns_sign_up/sns_sign_up.dart';
import 'package:withu/feature/account/domain/entity/company_sign_up/company_sign_up_res_entity.dart';
import 'package:withu/shared/dialogs/dialogs.dart';

class AccountRepositoryImpl implements AccountRepository {
  AccountRepositoryImpl({
    required this.accountApi,
    required this.accountStorage,
  });

  @override
  final AccountStorage accountStorage;

  @override
  final AccountApi accountApi;

  /// 토큰 리프레시
  @override
  FutureOr<bool> refreshToken() async {
    final refreshToken = await accountStorage.getRefreshToken();
    if (refreshToken.isNotEmpty) {
      final response = await accountApi.refresh(refreshToken);
      if (response.hasTokens) {
        storeTokens(
          response.data?.accessToken ?? '',
          response.data?.refreshToken ?? '',
        );

        return true;
      }
    }

    /// 리프레시 실패라면 저장된 토큰 삭제
    accountStorage.reset();
    return false;
  }

  /// 로그아웃
  @override
  Future logout() async {
    final refreshToken = await accountStorage.getRefreshToken();
    await accountApi.logout(refreshToken);
    accountStorage.reset();
  }

  /// 로그인 API 호출
  @override
  FutureOr<EmailLoginResDto> emailLogin({
    required EmailLoginReqData dto,
  }) async {
    return await accountApi.postEmailLogin(dto: dto);
  }

  /// 이메일 - 회사 회원가입
  @override
  FutureOr<CompanySignUpResEntity> requestCompanySignUp(
    CompanySignUpReqDto dto,
  ) async {
    final response = await accountApi.requestCompanySignUp(dto: dto);
    final token = response.data?.token;
    if (token != null && token.isNotEmpty == true) {
      storeTokens(token, response.data?.refreshToken ?? '');
    }
    return CompanySignUpResEntityParser.fromDto(response);
  }

  /// 이메일 - 직원 회원가입
  @override
  FutureOr<CompanySignUpResEntity> requestUserSignUp(
    UserSignUpReqDto dto,
  ) async {
    final response = await accountApi.requestUserSignUp(dto: dto);
    final token = response.data?.token;
    if (token != null && token.isNotEmpty == true) {
      storeTokens(token, response.data?.refreshToken ?? '');
    }
    return CompanySignUpResEntityParser.fromUserDto(response);
  }

  /// 애플 로그인 요청
  @override
  FutureOr<SnsLoginResValue> requestAppleLogin(AppleLoginReqDto dto) async {
    final response = await accountApi.postAppleLogin(dto: dto);
    final token = response.data?.token;
    final tempToken = response.data?.tempToken;
    final isRegistered = response.data?.isRegistered;

    if (response.hasErrorMessage) {
      Toast.showWithNavigatorKey(text: response.data!.message);
    }

    /// 로그인 성공
    if (isRegistered == true && token != null && response.hasToken) {
      storeTokens(token, response.data?.refreshToken ?? '');
    }

    /// 회원가입인 경우 임시토큰 저장
    if (tempToken != null && isRegistered == false) {
      accountStorage.setTempToken(tempToken);
    }

    return SnsLoginResValueParser.fromDto(response);
  }

  /// 이메일 회원 가입
  @override
  FutureOr<bool> postSnsSignUp(SnsSignUpReqDto dto, UserType userType) async {
    final response = await accountApi.postSnsSignUp(
      dto: dto,
      userType: userType,
    );

    final isSuccessSignUp = response.isSuccessSignUp;

    if (response.hasErrorMessage) {
      Toast.showWithNavigatorKey(text: response.message);
    }

    if (response.hasToken) {
      storeTokens(
        response.data?.token ?? '',
        response.data?.refreshToken ?? '',
      );
    }

    return isSuccessSignUp;
  }

  /// 아이디 찾기
  @override
  FutureOr<FindIdResValue> findId(String phone) async {
    final response = await accountApi.postFindId(
      dto: FindIdReqDto(phone: phone),
    );

    return FindIdResValueParser.fromDto(response);
  }

  /// 비밀번호 변경
  @override
  FutureOr<bool> changePw(ChangePwReqDto dto) async {
    final response = await accountApi.postChangePw(dto: dto);

    if (response.message.isNotEmpty) {
      Toast.showWithNavigatorKey(text: response.message);
    }

    return response.success;
  }

  @override
  void storeSnsSignUpData(LoginType type, String tempToken) {
    accountStorage.setSignUpType(type);
    accountStorage.setTempToken(tempToken);
  }

  @override
  void storeEmailSignUpData() {
    accountStorage.setSignUpType(LoginType.email);
    accountStorage.setTempToken('');
  }

  @override
  FutureOr<StoredSnsSignUpValue> getStoredSnsSignUpData() async {
    final tempToken = await accountStorage.getTempToken();
    final signUpType = await accountStorage.getSignUpType();

    return StoredSnsSignUpValue(type: signUpType, tempToken: tempToken);
  }

  @override
  FutureOr<MyProfileResDto> getMyProfile() async {
    return await accountApi.getMyProfile();
  }

  @override
  FutureOr<FcmRegistrationResDto> postFcmTokenRegistration({
    required UserType userType,
  }) async {
    final fcmToken = await FcmUtils.getFcmToken();

    if (fcmToken.isEmpty) {
      return FcmRegistrationResDtoMock.invalid();
    }

    if (userType.iSCompany) {
      return await accountApi.postCompanyTokenRegistration(
        TokenRegistrationReqDto(token: fcmToken),
      );
    } else {
      return await accountApi.postStaffTokenRegistration(
        TokenRegistrationReqDto(token: fcmToken),
      );
    }
  }

  /// Storage 초기화
  @override
  void resetStoredData() {
    accountStorage.reset();
  }

  /// Bearer 트큰 조회
  @override
  Future<String> getToken() async {
    return await accountStorage.getToken();
  }

  /// Bearer 토큰 저장
  @override
  void setToken(TokenListDto dto) {
    accountStorage.setToken(token: dto.accessToken);
    accountStorage.setRefreshToken(token: dto.refreshToken);
  }
}

extension AccountRepositoryImplEx on AccountRepositoryImpl {
  void storeTokens(String accessToken, String refreshToken) {
    accountStorage.setToken(token: accessToken);
    accountStorage.setRefreshToken(token: refreshToken);
  }
}
