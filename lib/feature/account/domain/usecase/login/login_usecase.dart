import 'dart:async';
import 'package:withu/core/core.dart';
import 'package:withu/core/router/router.gr.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/shared/dialogs/dialogs.dart';

part 'login_usecase.impl.dart';

abstract class LoginUseCase {
  LoginUseCase({required this.accountRepo});

  final AccountRepository accountRepo;

  /// 토큰 재발급(a.k.a 리로그인)
  Future<bool> refresh();

  /// 로그아웃
  Future<void> logout();

  Future<bool> requestEmailLogin({
    required EmailValue email,
    required PasswordValue password,
  });

  /// 애플 로그인 요청
  FutureOr<SnsLoginResValue> requestSnsLogin(String token);

  /// Sns 가입 정보 저장
  void storeSnsSignUpData(LoginType type, String tempToken);

  /// 이메일 가입 정보 저장
  void storeEmailSignUpData();
}
