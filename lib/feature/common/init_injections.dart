import 'package:withu/core/config/env/environment.dart';
import 'package:withu/core/utils/injections.dart';
import 'package:withu/feature/common/common.dart';
import 'package:withu/feature/common/domain/usecase/validate_business_usecase.dart';

void initCommonInjections() {
  _initDataInjections();
  _initDomainInjections();
  _initPresentationInjections();
}

void _initDataInjections() {
  getIt.registerSingleton<CommonApi>(
    Environment.isProd
        ? CommonApiImpl(network: getIt())
        : CommonMockApi(network: getIt()),
  );
  getIt.registerSingleton<CommonRepository>(
    CommonRepositoryImpl(commonApi: getIt()),
  );
}

void _initDomainInjections() {
  getIt.registerSingleton<ValidateBusinessUseCase>(
    ValidateBusinessUseCaseImpl(commonRepo: getIt()),
  );
  getIt.registerSingleton<PhoneAuthUseCase>(
    PhoneAuthUseCaseImpl(commonRepo: getIt()),
  );
}

void _initPresentationInjections() {
  getIt.registerFactory<ValidateBusinessBloc>(
    () => ValidateBusinessBloc(useCase: getIt()),
  );
  getIt.registerLazySingleton<PhoneAuthBloc>(
    () => PhoneAuthBloc(phoneAuthUseCase: getIt()),
  );
}
