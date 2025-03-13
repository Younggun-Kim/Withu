part of 'sign_up_use_case.dart';

class SignUpUseCaseImpl implements SignUpUseCase {
  @override
  final AccountRepository accountRepo;

  @override
  final LoginUseCase loginUseCase;

  SignUpUseCaseImpl({required this.accountRepo, required this.loginUseCase});

  @override
  FutureOr<bool> emailSignUp(CompanySignUpEntity entity) async {
    late final EmailSignUpResDto response;
    if (entity.accountType.isStaff) {
      response = await accountRepo.requestUserSignUp(entity.toReqDto());
    } else {
      response = await accountRepo.requestCompanySignUp(entity.toReqDto());
    }

    final tokens = response.data?.tokenPair;
    if (!response.isSuccess) {
      Toast.showWithNavigatorKey(text: response.message);
    }

    return loginUseCase.loginProcess(tokens: tokens);
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
