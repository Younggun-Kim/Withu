part of 'sign_up_use_case.dart';

class SignUpUseCaseImpl implements SignUpUseCase {
  @override
  final AccountRepository accountRepo;

  SignUpUseCaseImpl({required this.accountRepo});

  @override
  FutureOr<CompanySignUpResEntity> signUpCompanyRequested(
    CompanySignUpEntity entity,
  ) async {
    late final CompanySignUpResEntity response;
    if (entity.accountType.isUser) {
      response = await accountRepo.requestUserSignUp(entity.toUserDto());
    } else {
      response = await accountRepo.requestCompanySignUp(entity.toCompanyDto());
    }

    if (!response.isSuccess) {
      Toast.showWithNavigatorKey(text: response.message);
    }

    return response;
  }
}
