import 'package:withu/core/config/env/environment.dart';
import 'package:withu/core/utils/library/get_it/get_it_utils.dart';
import 'package:withu/feature/common/common.dart';
import 'package:withu/feature/common/domain/usecase/validate_business_usecase.dart';

void initCommonDataInjections() {
  getIt.registerSingleton<CommonApi>(
    Environment.isRelease
        ? CommonApiImpl(network: getIt())
        : CommonMockApi(network: getIt()),
  );
  getIt.registerSingleton<CommonRepository>(
    CommonRepositoryImpl(commonApi: getIt()),
  );
}

void initDomainInjections() {
  getIt.registerSingleton<ValidateBusinessUseCase>(
    ValidateBusinessUseCaseImpl(commonRepo: getIt(), accountRepo: getIt()),
  );
  getIt.registerSingleton<PhoneAuthUseCase>(
    PhoneAuthUseCaseImpl(commonRepo: getIt()),
  );
  getIt.registerSingleton<AreaUseCase>(AreaUseCaseImpl(commonRepo: getIt()));
}

void initPresentationInjections() {
  getIt.registerFactory<ValidateBusinessBloc>(
    () => ValidateBusinessBloc(useCase: getIt()),
  );
  getIt.registerFactory<PhoneAuthBloc>(
    () => PhoneAuthBloc(phoneAuthUseCase: getIt()),
  );
  getIt.registerFactory<AreaBloc>(() => AreaBloc(areaUseCase: getIt()));
}
