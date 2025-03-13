import 'package:withu/core/core.dart';

import 'home.dart';

void initHomeDataDI() {}

void initHomeDomainDI() {
  getIt.registerLazySingleton<ProfileUseCase>(() => ProfileUseCaseImpl());
}

void initHomePresentationDI() {
  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(loginUseCase: getIt(), getUserProfileUseCase: getIt()),
  );
  getIt.registerFactory<ProfileBloc>(
    () => ProfileBloc(profileUseCase: getIt()),
  );
}
