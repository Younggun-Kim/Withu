import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';

import 'presentation/bloc/change_pw/change_pw_bloc.dart';

void initAccountDataInjections() {
  getIt.registerSingleton<AccountApi>(
    Environment.isRelease
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
    SignUpUseCaseImpl(accountRepo: getIt(), loginUseCase: getIt()),
  );
  getIt.registerSingleton<EmailLoginUseCase>(
    EmailLoginUseCaseImpl(accountRepo: getIt()),
  );
  getIt.registerSingleton<FindAccountUseCase>(
    FindAccountUseCaseImpl(accountRepo: getIt()),
  );
  getIt.registerSingleton<ChangePwUseCase>(
    ChangePwUseCaseImpl(accountRepo: getIt()),
  );
  getIt.registerLazySingleton<ProfileRegistrationUseCase>(
    () => ProfileRegistrationUseCaseImpl(accountRepo: getIt()),
  );
}

void initAccountPresentationInjections() {
  getIt.registerFactory<TermBloc>(() => TermBloc(accountRepo: getIt()));
  getIt.registerFactory<LoginBloc>(() => LoginBloc(loginUseCase: getIt()));
  getIt.registerFactory<SignUpBloc>(() => SignUpBloc(signUpUseCase: getIt()));
  getIt.registerFactory<EmailLoginBloc>(
    () => EmailLoginBloc(loginUseCase: getIt()),
  );
  getIt.registerFactory<FindAccountBloc>(
    () => FindAccountBloc(findAccountUseCase: getIt()),
  );
  getIt.registerFactory<ChangePwBloc>(
    () => ChangePwBloc(changePwUseCase: getIt()),
  );
  getIt.registerFactory<ProfileRegistrationBloc>(
    () => ProfileRegistrationBloc(profileRegistrationUseCase: getIt()),
  );
}
