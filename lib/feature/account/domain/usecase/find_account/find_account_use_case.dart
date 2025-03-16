import 'dart:async';
import 'package:withu/feature/account/account.dart';
import 'package:withu/shared/dialogs/dialogs.dart';

part 'find_account_use_case_impl.dart';

abstract class FindAccountUseCase {
  final AccountRepository accountRepo;

  FindAccountUseCase({required this.accountRepo});

  /// 아이디찾기
  FutureOr<FindIdResValue> findId(String phone);
}
