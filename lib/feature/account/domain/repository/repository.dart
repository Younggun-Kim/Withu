import 'dart:async';

import 'package:withu/core/core.dart';
import 'package:withu/feature/account/data/data.dart';
import 'package:withu/feature/account/domain/entity/company_sign_up/company_sign_up_res_entity.dart';

abstract class AccountRepository {
  AccountRepository({required this.accountApi, required this.accountStorage});

  final AccountStorage accountStorage;

  final AccountApi accountApi;

  /// 로그인 API 호출
  FutureOr<ApiResponse<LoginResponseDto>> login({
    required LoginRequestDto requestData,
  });

  /// Session Id Storage 에 저장
  void storeToken({required String token});

  /// Session Id Storage 에 조회
  Future<String> getToken();

  /// 회사 회원가입 요청
  FutureOr<CompanySignUpResEntity> requestCompanySignUp(
    CompanySignUpReqDto dto,
  );

  /// 근로자 회원가입 요청
  FutureOr<CompanySignUpResEntity> requestUserSignUp(UserSignUpReqDto dto);
}
