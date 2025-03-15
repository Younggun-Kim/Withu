import 'package:withu/core/core.dart';

import 'home.dart';

void initHomeDataDI() {}

void initHomeDomainDI() {
  getIt.registerLazySingleton<ProfileUseCase>(() => ProfileUseCaseImpl());
}

void initHomePresentationDI() {
  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(loginUseCase: getIt(), getUserInfoUseCase: getIt()),
  );
  getIt.registerFactory<ProfileBloc>(
    () => ProfileBloc(getProfileUseCase: getIt()),
  );
}
