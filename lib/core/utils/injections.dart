import 'package:get_it/get_it.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/common/init_injections.dart';
import 'package:withu/feature/home/init_injectinos.dart';
import 'package:withu/feature/job_posting/init_injections.dart';
import 'package:withu/feature/splash/splash.dart';

final getIt = GetIt.instance;

AppRouter get getItAppRouter => getIt<AppRouter>();

void initNetworkInjections() {
  getIt.registerSingleton<DioNetwork>(DioNetwork());

  if (!Environment.isRelease) {
    getIt.registerSingleton<DioAdapter>(
      DioAdapter(dio: getIt<DioNetwork>().dio),
    );
  }
}

void initRouterInjections() {
  getIt.registerSingleton<AppRouter>(AppRouter());
}

/// 로그인 후 UserType 주입
void injectUserType(AccountType userType) {
  getIt.registerSingleton<AccountType>(userType);
}

Future<void> initInjections() async {
  injectUserType(AccountType.company);

  initRouterInjections();
  initNetworkInjections();
  initSplashInjections();
  initJobPostingInjections();
  await initDataDI();
  await initDomainDI();
  await initPresentationDI();
}

Future<void> initDataDI() async {
  initAccountDataInjections();
  initCommonDataInjections();
  initHomeDataDI();
}

Future<void> initDomainDI() async {
  initAccountDomainInjections();
  initDomainInjections();
  initHomeDomainDI();
}

Future<void> initPresentationDI() async {
  initAccountPresentationInjections();
  initPresentationInjections();
  initHomePresentationDI();
}
