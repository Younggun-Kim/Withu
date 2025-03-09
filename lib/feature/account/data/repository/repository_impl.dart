import 'dart:async';

import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/account/domain/entity/company_sign_up/company_sign_up_res_entity.dart';

class AccountRepositoryImpl implements AccountRepository {
  AccountRepositoryImpl({
    required this.accountApi,
    required this.accountStorage,
  });

  @override
  final AccountStorage accountStorage;

  @override
  final AccountApi accountApi;

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
      accountStorage.setToken(token: response.data!.token);
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
    }
    return CompanySignUpResEntityParser.fromUserDto(response);
  }
}
