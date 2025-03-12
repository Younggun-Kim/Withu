import 'package:withu/core/core.dart';

import 'home.dart';

void initHomeDataDI() {}

void initHomeDomainDI() {}

void initHomePresentationDI() {
  getIt.registerFactory<HomeBloc>(() => HomeBloc(loginUseCase: getIt()));
}
