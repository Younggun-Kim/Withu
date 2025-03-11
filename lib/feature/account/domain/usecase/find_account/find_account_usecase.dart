import 'dart:async';
import 'package:withu/feature/account/account.dart';

part 'find_account_usecase_impl.dart';

abstract class FindAccountUseCase {
  final AccountRepository accountRepo;

  FindAccountUseCase({required this.accountRepo});

  /// 아이디찾기
  FutureOr<FindIdResValue> findId(String phone);

  /// 비밀번호 찾기
  FutureOr<bool> findPw({required LoginRequestEntity entity});
}
