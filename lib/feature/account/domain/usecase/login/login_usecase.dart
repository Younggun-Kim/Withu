import 'dart:async';
import 'package:withu/core/core.dart';
import 'package:withu/core/router/router.gr.dart';
import 'package:withu/feature/account/account.dart';

part 'login_usecase.impl.dart';

abstract class LoginUseCase {
  LoginUseCase({required this.accountRepo});
  final AccountRepository accountRepo;

  /// 리프테시
  Future<bool> refresh();

  /// 로그아웃
  Future<void> logout();

  /// 로그인
  Future<LoginResultEntity> login({required LoginRequestEntity entity});

  /// 로그인 여부
  Future<bool> checkLogin();

  /// 애플 로그인 요청
  FutureOr<SnsLoginResValue> requestAppleLogin(String token);

  /// Sns 가입 정보 저장
  void storeSnsSignUpData(LoginType type, String tempToken);

  /// 이메일 가입 정보 저장
  void storeEmailSignUpData();
}
