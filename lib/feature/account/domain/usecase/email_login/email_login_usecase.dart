import 'dart:async';

import 'package:withu/feature/account/account.dart';

abstract class EmailLoginUseCase {
  final AccountRepository accountRepo;

  EmailLoginUseCase({required this.accountRepo});

  FutureOr<bool> login({
    required EmailValue email,
    required PasswordValue password,
  });
}

class EmailLoginUseCaseImpl implements EmailLoginUseCase {
  @override
  AccountRepository accountRepo;

  EmailLoginUseCaseImpl({required this.accountRepo});

  @override
  FutureOr<bool> login({
    required EmailValue email,
    required PasswordValue password,
  }) async {
    final response = await accountRepo.emailLogin(
      dto: EmailLoginReqData(
        email: email.value,
        password: password.value,
        userType: 'AUTO',
      ),
    );

    final tokens = response.data?.tokens;
    if (!response.success || tokens == null) {
      return false;
    }

    accountRepo.setToken(tokens);
    return false;
  }
}
