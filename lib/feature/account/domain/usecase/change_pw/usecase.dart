import 'dart:async';

import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/account/domain/entity/change_pw/change_pw_value.dart';

abstract class ChangePwUseCase {
  final AccountRepository accountRepo;

  ChangePwUseCase({required this.accountRepo});

  FutureOr<bool> changePw(ChangePwValue value);
}

class ChangePwUseCaseImpl implements ChangePwUseCase {
  @override
  AccountRepository accountRepo;

  ChangePwUseCaseImpl({required this.accountRepo});

  @override
  FutureOr<bool> changePw(ChangePwValue value) async {
    return await accountRepo.changePw(value.toDto());
  }
}
