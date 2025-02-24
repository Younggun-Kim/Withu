import 'dart:async';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';

part 'login_usecase.impl.dart';

abstract class LoginUseCase {
  final AccountRepository accountRepo;

  LoginUseCase({required this.accountRepo});

  /// 로그인
  Future<LoginResultEntity> login({
    required LoginRequestEntity entity,
  });

  /// 로그인 여부
  Future<bool> checkLogin();
}
