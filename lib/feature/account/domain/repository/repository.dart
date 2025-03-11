import 'dart:async';

import 'package:withu/core/core.dart';
import 'package:withu/feature/account/data/data.dart';
import 'package:withu/feature/account/domain/entity/company_sign_up/company_sign_up_res_entity.dart';
import 'package:withu/feature/account/domain/entity/find_id_res/find_id_res_value.dart';
import 'package:withu/feature/account/domain/entity/sns_login_res/sns_login_res_value.dart';

abstract class AccountRepository {
  AccountRepository({required this.accountApi, required this.accountStorage});

  final AccountStorage accountStorage;

  final AccountApi accountApi;

  /// 로그인 API 호출
  FutureOr<ApiResponse<LoginResponseDto>> login({
    required LoginRequestDto requestData,
  });

  /// 이메일 로그인
  FutureOr<bool> emailLogin({required EmailLoginReqData dto});

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

  /// 애플 로그인 요청
  /// return - (bool) 로그인 성공 여부, false 회원가입
  FutureOr<SnsLoginResValue> requestAppleLogin(AppleLoginReqDto dto);

  /// 아이디 찾기 요청
  FutureOr<FindIdResValue> findId(String phone);

  /// 비밀번호 변경 요청
  /// return - (bool) 변경 성공 여부
  FutureOr<bool> changePw(ChangePwReqDto dto);
}
