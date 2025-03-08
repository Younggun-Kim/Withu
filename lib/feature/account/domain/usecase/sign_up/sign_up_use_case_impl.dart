part of 'sign_up_use_case.dart';

class SignUpUseCaseImpl implements SignUpUseCase {
  @override
  final AccountRepository accountRepo;

  SignUpUseCaseImpl({required this.accountRepo});

  @override
  FutureOr<CompanySignUpResEntity> signUpCompanyRequested(
    CompanySignUpEntity entity,
  ) async {
    return await accountRepo.requestCompanySignUp(entity.toDto());
  }
}
