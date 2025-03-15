import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import '../common/domain/usecase/upload_image/upload_image_use_case.dart';
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
  getIt.registerSingleton<FindAccountUseCase>(
    FindAccountUseCaseImpl(accountRepo: getIt()),
  );
  getIt.registerSingleton<ChangePwUseCase>(
    ChangePwUseCaseImpl(accountRepo: getIt()),
  );
  getIt.registerLazySingleton<ProfileAddUseCase>(
    () => ProfileAddUseCaseImpl(accountRepo: getIt()),
  );
  getIt.registerLazySingleton<GetUserProfileUseCase>(
    () => GetUserProfileUseCaseImpl(repo: getIt()),
  );
  getIt.registerLazySingleton<UploadImageUseCase>(
    () => UploadImageUseCaseImpl(commonRepo: getIt()),
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
  getIt.registerFactory<ProfileAddBloc>(
    () =>
        ProfileAddBloc(uploadImageUseCase: getIt(), profileAddUseCase: getIt()),
  );
}
