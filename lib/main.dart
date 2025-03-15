import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:withu/core/core.dart';

void run({required EnvironmentType environment}) async {
  Environment.env = environment;

  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await DotEnvUtils.init();

  await LocalPushUtils.initialize();

  await FirebaseInit.init();

  await AmplitudeUtils.init();

  // Init DI
  await initInjections();

  /// 서버 인증서(CA) 가 공인된 인증서가 아닌 이슈 해결
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ko')],
      fallbackLocale: const Locale('ko'),
      startLocale: const Locale('ko'),
      path: 'assets/translations',
      child: GlobalBlocProvider(
        create: (context) => GlobalBloc(),
        child: GlobalBlocConsumer(
          listener: (context, state) {
            logger.i(state.profileInfo);
          },
          builder: (context, state) {
            return App();
          },
        ),
      ),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: CustomTheme.theme,
      routerConfig: getItAppRouter.config(
        navigatorObservers:
            () => [FirebaseAnalyticsObserver(analytics: analytics)],
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    // '?'를 추가해서 null safety 확보
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
