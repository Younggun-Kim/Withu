import 'dart:async';

import 'package:withu/core/types/login_type.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/account/domain/entity/company_sign_up/company_sign_up_res_entity.dart';
import 'package:withu/shared/dialogs/toast/toast.dart';

part 'sign_up_use_case_impl.dart';

abstract class SignUpUseCase {
  final AccountRepository accountRepo;

  SignUpUseCase({required this.accountRepo});

  FutureOr<CompanySignUpResEntity> signUpCompanyRequested(
    CompanySignUpEntity entity,
  );

  Future<LoginType> getLoginType();

  FutureOr<bool> snsSignUp(SnsSignUpReqValue data, UserType type);
}
