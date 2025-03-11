import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';

void initAccountInjections() {
  initAccountDataInjections();
  initAccountDomainInjections();
  initAccountPresentationInjections();
}

void initAccountDataInjections() {
  getIt.registerSingleton<AccountApi>(
    Environment.isProd
        ? AccountApiImpl(network: getIt())
        : AccountMockApi(network: getIt()),
  );
  getIt.registerSingleton<AccountStorage>(AccountStorageImpl());
  getIt.registerSingleton<AccountRepository>(
    AccountRepositoryImpl(accountApi: getIt(), accountStorage: getIt()),
  );
}

void initAccountDomainInjections() {
  getIt.registerSingleton<LoginUseCase>(LoginUseCaseImpl(accountRepo: getIt()));
  getIt.registerSingleton<SignUpUseCase>(
    SignUpUseCaseImpl(accountRepo: getIt()),
  );
  getIt.registerSingleton<EmailLoginUseCase>(
    EmailLoginUseCaseImpl(accountRepo: getIt()),
  );
  getIt.registerSingleton<FindAccountUseCase>(
    FindAccountUseCaseImpl(accountRepo: getIt()),
  );
}

void initAccountPresentationInjections() {
  getIt.registerFactory<TermBloc>(() => TermBloc());
  getIt.registerFactory<LoginBloc>(() => LoginBloc(loginUseCase: getIt()));
  getIt.registerFactory<SignUpBloc>(() => SignUpBloc(signUpUseCase: getIt()));
  getIt.registerFactory<EmailLoginBloc>(
    () => EmailLoginBloc(emailLoginUseCase: getIt()),
  );
  getIt.registerFactory<FindAccountBloc>(
    () => FindAccountBloc(findAccountUseCase: getIt()),
  );
}
