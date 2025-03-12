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
    logger.i(refreshToken);
    if (refreshToken.isNotEmpty) {
      final response = await accountApi.refresh(refreshToken);
      if (response.hasTokens) {
        accountStorage.setToken(token: response.data?.accessToken ?? '');
        accountStorage.setRefreshToken(
          token: response.data?.refreshToken ?? '',
        );

        return true;
      }
    }
    return false;
  }

  /// 로그인 API 호출
  @override
  FutureOr<ApiResponse<LoginResponseDto>> login({
    required LoginRequestDto requestData,
  }) async {
    return await accountApi.login(requestData: requestData);
  }

  /// 로그인 API 호출
  @override
  FutureOr<bool> emailLogin({required EmailLoginReqData dto}) async {
    final response = await accountApi.postEmailLogin(dto: dto);

    if (response.hasToken) {
      accountStorage.setToken(token: response.data?.tokens.accessToken ?? '');
      accountStorage.setRefreshToken(
        token: response.data?.tokens.refreshToken ?? '',
      );
    } else {
      response.showErrorMessage();
    }
    return response.isSuccessLogin;
  }

  /// Session Id Storage 에 저장
  @override
  void storeToken({required String token}) {
    accountStorage.setToken(token: token);
  }

  /// Session Id Storage 에 조회
  @override
  Future<String> getToken() async {
    return await accountStorage.getToken();
  }

  /// 회원가입
  @override
  FutureOr<CompanySignUpResEntity> requestCompanySignUp(
    CompanySignUpReqDto dto,
  ) async {
    final response = await accountApi.requestCompanySignUp(dto: dto);
    return CompanySignUpResEntityParser.fromDto(response);
  }

  /// 회원가입
  @override
  FutureOr<CompanySignUpResEntity> requestUserSignUp(
    UserSignUpReqDto dto,
  ) async {
    final response = await accountApi.requestUserSignUp(dto: dto);
    final token = response.data?.token;
    if (token != null && token.isNotEmpty == true) {
      accountStorage.setToken(token: token);
      accountStorage.setRefreshToken(token: response.data?.refreshToken ?? '');
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
      accountStorage.setToken(token: token);
      accountStorage.setRefreshToken(token: response.data?.refreshToken ?? '');
    }

    /// 회원가입인 경우 임시토큰 저장
    if (tempToken != null && isRegistered == false) {
      accountStorage.setTempToken(tempToken);
    }

    return SnsLoginResValueParser.fromDto(response);
  }

  @override
  FutureOr<FindIdResValue> findId(String phone) async {
    final response = await accountApi.postFindId(
      dto: FindIdReqDto(phone: phone),
    );

    return FindIdResValueParser.fromDto(response);
  }

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
  FutureOr<bool> postSnsSignUp(
    SnsSignUpReqDto dto,
    AccountType userType,
  ) async {
    final response = await accountApi.postSnsSignUp(
      dto: dto,
      userType: userType,
    );

    final isSuccessSignUp = response.isSuccessSignUp;

    if (response.hasErrorMessage) {
      Toast.showWithNavigatorKey(text: response.message);
    }

    if (response.hasToken) {
      accountStorage.setToken(token: response.data!.token);
    }

    if (response.hasRefreshToken) {
      accountStorage.setToken(token: response.data!.token);
    }

    return isSuccessSignUp;
  }
}
