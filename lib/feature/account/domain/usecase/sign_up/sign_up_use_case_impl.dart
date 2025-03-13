part of 'sign_up_use_case.dart';

class SignUpUseCaseImpl implements SignUpUseCase {
  @override
  final AccountRepository accountRepo;

  @override
  final LoginUseCase loginUseCase;

  SignUpUseCaseImpl({required this.accountRepo, required this.loginUseCase});

  @override
  FutureOr<CompanySignUpResEntity> emailSignUp(
    CompanySignUpEntity entity,
  ) async {
    late final CompanySignUpResEntity response;
    if (entity.accountType.isStaff) {
      response = await accountRepo.requestUserSignUp(entity.toUserDto());
    } else {
      response = await accountRepo.requestCompanySignUp(entity.toCompanyDto());
    }

    if (!response.isSuccess) {
      Toast.showWithNavigatorKey(text: response.message);
    }

    return response;
  }

  @override
  Future<LoginType> getLoginType() async {
    return await accountRepo.accountStorage.getSignUpType();
  }

  @override
  FutureOr<bool> snsSignUp(SnsSignUpReqValue data, UserType type) async {
    final response = await accountRepo.postSnsSignUp(data.toDto(), type);
    final tokens = response.tokens;

    if (response.hasErrorMessage) {
      Toast.showWithNavigatorKey(text: response.message);
      return false;
    }

    return loginUseCase.loginProcess(tokens: tokens);
  }
}
