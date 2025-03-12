import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:withu/core/core.dart';
import 'package:withu/core/utils/firebase/firebase_init.dart';

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

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ko')],
      fallbackLocale: const Locale('ko'),
      startLocale: const Locale('ko'),
      path: 'assets/translations',
      child: const App(),
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
