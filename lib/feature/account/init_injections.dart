import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/common/presentation/bloc/phone_auth/phone_auth_bloc.dart';

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
    SignUpUseCaseImpl(repository: getIt()),
  );
}

void initAccountPresentationInjections() {
  getIt.registerFactory<PhoneAuthBloc>(
    () => PhoneAuthBloc(phoneAuthUseCase: getIt()),
  );
  getIt.registerFactory<TermBloc>(() => TermBloc());
  getIt.registerFactory<LoginBloc>(() => LoginBloc(loginUseCase: getIt()));
  getIt.registerFactory<SignUpBloc>(() => SignUpBloc(signUpUseCase: getIt()));
}
